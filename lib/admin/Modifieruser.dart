
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:projet_pfe/controller/usercontroller.dart';
import 'package:projet_pfe/controller/utilisateurController.dart';
import 'package:projet_pfe/models/artiste.dart';
import 'package:projet_pfe/models/utilisateur.dart';
import 'package:projet_pfe/user/user.dart';


class ModifierUseer extends StatelessWidget {
    ModifierUseer({super.key,required this.user});
    
    UtilisateurI user;

  @override
  Widget build(BuildContext context) {

    //modification d'artiste/contractant/rapporteur..

      final contoller = Get.find<UtilisateurControllerI>();
        return 
         Padding(
          padding: const EdgeInsets.all(10.0),
          child:
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            const Text("Modifier",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color:Color.fromARGB(255, 23, 69, 128),),),
           
            const SizedBox(height: 30,),
              
            TextFormField(
             controller:contoller.editroletext,
             decoration: const InputDecoration(      
             prefixIcon: Icon(
             Icons.person,
             color: Color.fromARGB(255, 20, 60, 92),),
             hintText: "Role..." ),),

            const SizedBox(height: 30,),


            Center(
            child: 
             Row(children:[
               Padding(
                padding: const EdgeInsets.only(left: 700),
                 child: InkWell(                                                                                            
                  onTap: ()async{                                                                                   
                    contoller.updateUser(user.iduser);},
                  child: Container(
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 65, 255, 7),
                    borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    child: const Text("modifier",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily:'Andalus',),), ),),),
                                                                         
            const SizedBox(width: 30,),

              Padding(
               padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                 onTap: ()async{  
                   contoller.cancel();},
                  child: Container(
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 7, 255),
                    borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    child: const Text("annuler",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily:'Andalus',),),),),),

             ]),)]),);
  }}









        
             
    
                    
  