// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/user/user.dart';
import 'Connexion.dart';


class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  var formKey=GlobalKey<FormState>();
  var nom=TextEditingController();
  var prenom=TextEditingController();
  var username=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController(); 
  var isObscure=true.obs;
  // ignore: prefer_typing_uninitialized_variables
  var role = "Utilisateur Interne";

  
   validateemailuser() async{
    try {
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body:{
          'email': email.text.trim(),
        }
      );
      if(response.statusCode==200)//from flutter app the connection with api to server ==success 
      {
        var resBodyValidation = jsonDecode(response.body);
        if(resBodyValidation['emailfound']==true){
         Fluttertoast.showToast(msg:"Email est déjà utilisé essayez un autre email");
        }
        else{
          //register and save new user  to database
          registerAndSave();
        }
      }
    }
    catch(e)
    {
      // ignore: avoid_print
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

    }
  }

   registerAndSave()async
    {
      User userModel = User (
        1,
        nom.text.trim(),//nom value go to the nom attribute
        prenom.text.trim(),
        username.text.trim(),
        email.text.trim(),
        password.text.trim(), 
        role.trim(),
      );
      try{
        var res= await http.post(
          Uri.parse(API.signUp),
          body:userModel.toJson(),
        );
        if(res.statusCode==200){
          var resSignUp = jsonDecode(res.body);
          if(resSignUp['success']==true){
            Fluttertoast.showToast(msg: "Vous êtes inscrit avec succès.");

            setState(() {
             
              nom.clear();
              prenom.clear();
              username.clear();
              email.clear();
              password.clear();

            });
          }
          else{
            Fluttertoast.showToast(msg: "Erreur,Réessayez.");
          }
        }
      }
      catch(e)
      {
        // ignore: avoid_print
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }      
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfff5faff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 540.0, start: 0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [Color(0xb5042e6a), Color(0x00ffffff)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.175, -0.647),
            child: SizedBox(
              width: 1210.0,
              height: 127.0,
              child: Stack(
                children: const <Widget>[
                  SizedBox.expand(
                      child: Text(
                    'Corpus Amazigh',
                    style: TextStyle(
                      fontFamily: 'Blenny',
                      fontSize: 95,
                      color: Color(0xffffffff),
                      letterSpacing: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )),
                ],
              ),
            ),
          ),
                  // login header banniere
          Pinned.fromPins(
            Pin(size: 160.0, start: 114.0),
            Pin(size: 160.0, start: 42.0),
            
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('ircam.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.012, 0.431),
            child: SizedBox(
              width: 400.0,
              height: 550.0,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(34.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x4dcdccf1),
                              offset: Offset(0, 5),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                         
                      
                      const SizedBox(height: 20,),
                        
                  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60,50, 40, 5),
                        child: Column(children: [
                          Form(
                            key: formKey,
                            child: 
                          Column(children: [
                            //nom
                            
                            TextFormField(
                              controller:nom,
                              validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom ":null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 20, 60, 92),
                                ),
                                hintText: "nom...",
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                   ),
                                   fillColor: const Color.fromARGB(255, 176, 201, 227),
                                   filled: true,
                              
                              ), 
                            ),
                             const SizedBox(height: 20,),

                             //prenom
                                TextFormField(
                              controller:prenom,
                              validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre prenom ":null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 20, 60, 92),
                                ),
                                hintText: "prenom...",
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                   ),
                                   fillColor: const Color.fromARGB(255, 176, 201, 227),
                                   filled: true,
                              
                              ), 
                            ),
                             const SizedBox(height: 20,),

                             //username
                              TextFormField(
                              controller:username,
                              validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom d'utilisateur ":null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                  color: Color.fromARGB(255, 20, 60, 92),
                                ),
                                hintText: "nom d'utilisateur...",
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                   ),
                                   fillColor: const Color.fromARGB(255, 176, 201, 227),
                                   filled: true,
                              
                              ), 
                            ),
                            
                             const SizedBox(height: 20,),

                             //Email
                              TextFormField(
                              controller:email,
                              validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre email":null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 20, 60, 92),
                                ),
                                hintText: "email...",
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                   ),
                                   fillColor: const Color.fromARGB(255, 176, 201, 227),
                                   filled: true,
                              
                              ), 
                            ),

                             const SizedBox(height: 20,),

                             //password
                             Obx(
                              () => 
                             TextFormField(
                              controller: password,
                              obscureText: isObscure.value,
                              validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre mot de passe":null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.vpn_key,
                                  color: Color.fromARGB(255, 20, 60, 92),
                                ),
                                suffixIcon: Obx(
                                  () => 
                                  GestureDetector(
                                    onTap: (){
                                      isObscure.value = !isObscure.value;

                                    },
                                    child: Icon(
                                      isObscure.value ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  )),
                                hintText: "mot de passe ...",
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.white60,),
                                   ),
                                   contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                   ),
                                   fillColor: const Color.fromARGB(255, 176, 201, 227),
                                   filled: true,
                              
                              ),
                            )
                          ),
                          
                          const SizedBox(height: 10,),

                             // button
                           Material(
                            color: const Color.fromARGB(255, 4, 62, 125),
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  //validate the email(email most be unique)
                                  validateemailuser();
                                  Get.to(() => const Connexion());
                                }
                              },
                              borderRadius: BorderRadius.circular(30),
                              // ignore: prefer_const_constructors
                              child: Padding(padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              // ignore: prefer_const_constructors
                              child: Text(
                              "Inscription"  ,
                               style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              ),),
                             
                            ),
                          ),
                          ],
                          ),
                        
                          )
                        ],
                        ),
                      )
          
                    ],
                  ),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  } 
}

