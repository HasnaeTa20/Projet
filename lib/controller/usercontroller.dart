import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/models/artiste.dart';


class UserController extends GetxController{

  //step 1 create instance
  var contactants = <Artiste>[].obs;
  TextEditingController nomtext=TextEditingController();
  TextEditingController prenomtext=TextEditingController();

  TextEditingController editnomtext=TextEditingController();
  TextEditingController editprenomtext=TextEditingController();


  //step 2 create methode

  //Add
  addUser() async {
    Uri url1=Uri.parse(API.addArtiste);
  
  //   //step 3 create data or assing data
   final userdata = Artiste(
      nom:nomtext.text,
      prenom:prenomtext.text,
    );
    //step 4 post data to api
   try{
    var res= await http.post(url1,
    body:(userdata.toJson()));
    if(res.statusCode==200){
      var result = jsonDecode(res.body);
      
      Fluttertoast.showToast(msg: "ajout avec succès");
      // Get.snackbar("post" , "succefully");
         clear();
      await getUser();
    }
  }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
     // Get.snackbar("error", "$e");
   }
  }

    //getAll

    getUser()async{
      Uri url2 = Uri.parse(API.getArtiste);
      try{
        var result = await http.get(url2);
        if(result.statusCode==200){
        var data= List<Artiste>.from(
          jsonDecode(result.body).map((e)=>Artiste.fromJson(e))).toList();
        if(data!= null){
          contactants.value = data;
        }
      }
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
 }

 //update

 updateUser( id)async{
  Uri url3=Uri.parse("${API.upArtiste}/$id");
  final data = Artiste(
  id:id,
   nom: editnomtext.text,
  prenom: editprenomtext.text,
  );
 try{
    var resultat = await http.post(url3,
    body:(data.toJson()));
     if(resultat.statusCode==200){
        Get.back();
        var result = jsonDecode(resultat.body);
        await getUser();
        Fluttertoast.showToast(msg: "modification avec succès");
        // Get.snackbar("success", "update"); 
        } 
       }
       catch(e){
        Fluttertoast.showToast(msg: e.toString());
      //  Get.snackbar("error", "failed updating");
       }
   
     update();
   }

 // delete

 deleteUser(id)async{
  Uri url4=Uri.parse("${API.deArtiste}/$id");
  try{
  var res =await http.post(url4,body: {"id":id,});
  if(res.statusCode==200){
  

    await getUser();
    Fluttertoast.showToast(msg: "suppression avec succès");
    // Get.snackbar("delete", "success");
        }

  }
  catch(e){
    Fluttertoast.showToast(msg: e.toString());
    // Get.snackbar("error", "failed deleting");
    }
  update();
 }

  clear(){
    nomtext.clear();
    prenomtext.clear();
  }

   eclear(){
    editnomtext.clear();
    editprenomtext.clear();
  } 

  Annuler(){
    clear();
    getUser();
  }

cancel(){
  Get.back();
  getUser();
}
 

@override
  void onInit() {
    getUser();
    super.onInit();
  }

}









//  deleteUser(String i)async{
//   Uri url4=Uri.parse("${API.deArtiste}/$i");
//   var res =await http.delete(url4);
//   if(res.statusCode==200){
//     await getUser();
//     Get.snackbar("delete", "success");


//   }

//  }
