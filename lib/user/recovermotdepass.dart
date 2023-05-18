import 'dart:convert' show json, jsonDecode;
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/user/Connexion.dart';
import 'package:http/http.dart' as http;

class RecoverPass extends StatefulWidget {
  const RecoverPass({super.key});

  @override
  State<RecoverPass> createState() => _RecoverPassState();
}

class _RecoverPassState extends State<RecoverPass> {
  var formKey=GlobalKey<FormState>();
  var username=TextEditingController();
  var verifyLink;
  bool verifyButton = false;


 //verifier le username

  Future checkUser()async{
      try{
        var response = await http.post(
          Uri.parse(API.ckeck),
          body:{
            "username":username.text, 
          });

         if(response.statusCode==200){ 
          var link = jsonDecode(response.body);
          if(link == "INVALIDE USER"){
           Fluttertoast.showToast(msg: "Cet Utilisateur n'est pas dans la Base de Données");
          }
          else{
            setState(() {
             verifyLink = link;
             verifyButton =  true;
                });
        Fluttertoast.showToast(msg: "Cliquez sur le bouton de Validation pour réinitialiser le mot de passe");
          }
          print(link);
         }
        }
      catch(e){ 
         // ignore: avoid_print
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }

  //réinitialiser le mot de passe

  int newPass=0;
  Future resetPasword()async{
    try{
    
     var response = await http.post(Uri.parse(verifyLink));
     var link = jsonDecode(response.body);
     setState(() {
      newPass = link;  
     });

     print(link);
     Fluttertoast.showToast(msg: "votre mot de passe a été réinitialisé:$newPass");
 
   }
   catch(e){
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
              ),),),),

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
                      fontWeight: FontWeight.w900,),
                      textAlign: TextAlign.center,
                      softWrap: false,)),
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
                fit: BoxFit.fill, ),),),),

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
                            ),],),),

                const SizedBox(height: 50,),
                
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,100, 40, 8),
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
                          color: Color.fromARGB(255, 20, 60, 92), ),
                          hintText: "nom d'utilisateur...",
                          border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                          color: Colors.white60,),),
                          enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                          color: Colors.white60,),),
                          focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                          color: Colors.white60,),),
                          disabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                          color: Colors.white60,),),
                          contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,),
                          fillColor: const Color.fromARGB(255, 176, 201, 227),
                          filled: true,),),

                const SizedBox(height: 30,),

                  // button de vérification
                    Material(
                      color: const Color.fromARGB(255, 4, 62, 125),
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                      onTap: ()
                       {                        
                         checkUser()  ;       
                        },
                        borderRadius: BorderRadius.circular(30),
                        // ignore: prefer_const_constructors
                        child: Padding(padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 28,),
                        child:  const Text(
                        "Récupérer mot de passe"  ,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,),
                        ),),),),

                  const SizedBox(height:10 ),

                       //button de réinitialisation

                        verifyButton ?
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                             Material(
                                color: Color.fromARGB(255, 49, 198, 76),
                                borderRadius: BorderRadius.circular(30),
                                 child: InkWell(
                                 onTap: ()
                                {                        
                                 resetPasword();     
                                 },
                                borderRadius: BorderRadius.circular(30),
                               // ignore: prefer_const_constructors
                                child: Padding(padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,),
                                child:  const Text(
                                "Valider"  ,
                                style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,),
                                ),),),),
                            
                            ],
                            )
                            :   Container(),
                            newPass == 0 ? Container():Text('Votre nouveau mot de passe est:$newPass'),
                                               
                          //retourner ver la page connexion 
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            const Text(
                            "Retourner vers"),
                            TextButton(
                            onPressed: () {
                              Get.to(()=>const Connexion());   
                            },
                            child: const Text(
                            "Connexion",
                                  style: TextStyle(
                                   color:Colors.blue,
                                   fontSize: 16,),),),
                            ],),],),),)
                  ],
                ),
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

