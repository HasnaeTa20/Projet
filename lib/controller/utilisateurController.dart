import 'dart:convert';

import 'package:flutter/cupertino.dart';



import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/models/utilisateur.dart';

class UtilisateurControllerI extends GetxController{

 var utilisateurs = <UtilisateurI>[].obs;
 var searchList = <UtilisateurI>[].obs;
 TextEditingController editroletext=TextEditingController();
   var nom=TextEditingController();
  var prenom=TextEditingController();
  var username=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController(); 
  var role ;
  // ignore: prefer_typing_uninitialized_variables
 


 getUser()async{
      Uri url2 = Uri.parse(API.getall);
      try{
        var result = await http.get(url2);
        if(result.statusCode==200){
        var data= List<UtilisateurI>.from(
          jsonDecode(result.body).map((e)=>UtilisateurI.fromJson(e))).toList();
        if(data!= null){
          utilisateurs.value = data;
          // searchList.value=data;
         
        }
       
      }
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());

    }
     update();
 }


 
 updateUser( id)async{

  Uri url3=Uri.parse("${API.updateuser}/$id");
  final data = UtilisateurI(
    
  id,
   nom.text,
   prenom.text,
   username.text,
   email.text,
   password.text,
   editroletext.text,
  

  );
 try{
    var resultat = await http.post(url3,
    body:(data.toJson()));
  
     if(resultat.statusCode==200){
        Get.back();
        var result = jsonDecode(resultat.body);
        await getUser();

       Fluttertoast.showToast(msg: "modification avec succès"); } 
       
       }catch(e){
      Fluttertoast.showToast(msg: e.toString());
       }
   
 update();


 }

  deleteUser(id)async{
  Uri url4=Uri.parse("${API.deleteuser}/$id");
  try{
  var res =await http.post(url4,body: {"iduser":id,});
  if(res.statusCode==200){
  
    await getUser();
   Fluttertoast.showToast(msg: "suppression avec succès");
        }

  }
  catch(e){
     Fluttertoast.showToast(msg: e.toString());
    }
  update();

 }
  void cancel() {
    Get.back();
  getUser();
  }
        @override
  void onInit() {
    getUser();
    super.onInit();
  }
   onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        searchList.sort(((a, b) =>a.nom.compareTo(b.nom) ));
        
      } else {
      
       searchList.sort(((a, b) => b.nom.compareTo(a.nom)));
      }
       
    }
    update();
  }




}

