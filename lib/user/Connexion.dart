
import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:projet_pfe/admin/Admin.dart';
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/moderateur/Alimentation.dart';
import 'package:projet_pfe/user/cone.dart';
import 'package:projet_pfe/user/recovermotdepass.dart';
import 'package:projet_pfe/user/user.dart';
import 'package:projet_pfe/user/userpreferences.dart';
import 'package:projet_pfe/widget/listingcorpus.dart';
import './Inscription.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;


class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();

}

class _ConnexionState extends State<Connexion> {
  var formKey=GlobalKey<FormState>();
  var username=TextEditingController();
  var password=TextEditingController(); 
  var isObscure=true.obs;



  connexionUser()async
  {
      try{
        var res= await http.post(
          Uri.parse(API.login),
          body:{
            "username":username.text.trim(),
            "password":password.text.trim(),
          },
        );
         if(res.statusCode==200){ //from flutter app the connection with api to server_success
          var reslogin = jsonDecode(res.body);
          if(reslogin["success"]==true){

          //   SharedPreferences preferences = await SharedPreferences.getInstance();
          // preferences.setString('username', username.text);
          

            Fluttertoast.showToast(msg: "connexions avec succès.",
             toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
      User userInfo =User.fromJson(reslogin["userData"]);
      //save userInfo to local Storage using Shared Preferences
          await RememeberUserPrefs.saveUserData(userInfo);
           
           
           
            Future.delayed(const Duration(milliseconds: 20),(){

              Get.to(() => const Corpus());
              // Navigator.push(
              //     context as BuildContext,
              //     MaterialPageRoute(
              //       builder: (context) => Corpus(),
              //     ),
              //   )
             
             
             });
             
             }
           else{
            Fluttertoast.showToast(
              msg: "Le nom d’utilisateur ou le mot de passe est incorrect. Réessayez.",
               toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
          }
        }
      }
      catch(e){
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
          Expanded(child: 
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
          ),),

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
         Expanded(child: Align(
            alignment: const Alignment(-0.012, 0.431),
            child: SizedBox(
              width: 400.0,
              height:400.0,
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
                         
                      const SizedBox(height: 50,),

                        Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60,50, 40, 8),
                          child: Form(
                              key: formKey,
                              child: 
                            Column(children: [

                              //username
                              TextFormField(
                                controller: username,
                                validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom d'utilisateur":null,
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

                               const SizedBox(height: 30,),
                        
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
                              ),
                            ),
                            
                            const SizedBox(height: 15,),
                        
                               // button
                            Material(
                              color: const Color.fromARGB(255, 4, 62, 125),
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: ()
                                {     
                                  if(formKey.currentState!.validate())
                                  {
                                    connexionUser()  ; 
                                    }                  
                                },
                                
                                borderRadius: BorderRadius.circular(30),
                                // ignore: prefer_const_constructors
                                child: Padding(padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 28,
                                ),
                                child:  const Text(
                                  "Connexion"  ,
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16, ),),),),),

                            const SizedBox(height:10 ),

                             //dont have account -sign up button
                        
                              Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:[
                             const Text(
                             "vous n'avez pas un compte?"),
                               TextButton(
                                onPressed: () 
                                {
                                 Get.to(() => const Inscription());   
                                },

                                child: const Text(
                                  "Inscription",
                                   style: TextStyle(
                                   color:Colors.blue,
                                   fontSize: 16,),),),
                              ], ),    
                                               
                              //Or
                            const Text(
                                "Ou",
                                style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12, ),),

                            //are you an admin - click here button 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                               const Text(
                                  "vous etes Admin?"),
                                  TextButton(
                                  onPressed: () 
                                  {
                                    Get.to(()=>const Admin()); 
                                  },
                                  child: const Text(
                                  "Clique ici",
                                   style: TextStyle(
                                   color:Colors.blue,
                                   fontSize: 14,), ),),
                        ],),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            TextButton(
                              onPressed: ()
                               {
                                Get.to(()=>const RecoverPass());  
                                },
                                child: const Text(
                                  "Mot de pass oublié?",
                                   style: TextStyle(
                                   color:Colors.blue,
                                   fontSize: 14,), ),),
                              ],),
                            ],), 
                        ),)
                      ],),
                    ],
                  ),
                ],
              ),
            ),
          ),)
         
        ],
      ),
    );
  }
}

