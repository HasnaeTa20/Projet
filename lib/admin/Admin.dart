// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';



class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();

}

class _AdminState extends State<Admin> {
  var email=TextEditingController();
  var password=TextEditingController(); 
  var isObscure=true.obs;

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
              height: 400.0,
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
                        
                  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60,90, 60, 8),
                        child: Column(children: [
                          Form(child: 
                          Column(children: [
                            //username
                            TextFormField(
                              controller: email,
                              validator:(val)=> val  == "" ?"s'il vous plît ecrire votre nom d'utilisateur":null,
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
                              validator:(val)=> val  == "" ?"s'il vous plît ecrire votre mot de passe":null,
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
                          
                          const SizedBox(height: 15,),

                             // button
                          Material(
                            color: const Color.fromARGB(255, 4, 62, 125),
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: ()
                              {

                              },
                              borderRadius: BorderRadius.circular(30),
                              child: const Padding(padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                              "Connexion"  ,
                              style: TextStyle(
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

