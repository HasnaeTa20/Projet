
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_pfe/api/connection.dart';


class TitleSelect extends StatefulWidget {
  const TitleSelect({super.key});

  @override
  State<TitleSelect> createState() => _TitleSelectState();
}

class _TitleSelectState extends State<TitleSelect> {
  var formKey=GlobalKey<FormState>();
  var categorie=TextEditingController();
  var motcle=TextEditingController();
  var titre=TextEditingController();
  var date=TextEditingController();
  String?  selectedValue;
  List itemList=[];
  var value="-1";
  
 Future getAllItem()async{
     Uri url = Uri.parse(API.getArtiste);
        var result = await http.get(url);
        if(result.statusCode==200){
        var jsonData=json.decode(result.body);
      setState(() {
         itemList=jsonData;  
      });}
       print(itemList); 
    }
      @override
        void initState(){
          super.initState();
          getAllItem(); 
       }
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: formKey,
          child:Column(
          children:[
            TextFormField(
            controller:categorie,
            validator:(val)=> val  == "" ?"s'il vous plaît ecrire une categorie ":null,
            decoration: InputDecoration(
            hintText: "categorie...",
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
            filled: true, ),),

            const SizedBox(height: 10,),
             
            TextFormField(
            controller:motcle,
            validator:(val)=> val  == "" ?"s'il vous plaît ecrire des mots clés ":null,
            decoration: InputDecoration(             
            hintText: "motClé...",
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
            filled: true,   ),),

            const SizedBox(height: 10,),

            TextFormField(
            controller:titre,
            validator:(val)=> val  == "" ?"s'il vous plaît ecrire un titre ":null,
            decoration: InputDecoration(
            hintText: "titre...",
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

            const SizedBox(height: 10,),

            TextFormField(
            controller:date,
            validator:(val)=> val  == "" ?"s'il vous plaît ecrire une date ":null,
            decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_month),
            hintText: "date...",
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
            filled: true,),),]), 
          ), ),

        Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
              value: selectedValue,
              hint: Text("selectionner"),
              items: itemList.map((item) {
              return DropdownMenuItem(
              value: item['nom'],
              child: Text(item['nom']),);
                }).toList(),
              onChanged: (value){
                  setState(() {
                    selectedValue=value as String?;
                  });},
                ),
                
            ),
              
    ],
    

    );
    
    
  }
}
