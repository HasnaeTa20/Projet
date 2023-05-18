
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_pfe/widget/appercu.dart';
import 'package:projet_pfe/widget/listingcorpus.dart';
import 'package:projet_pfe/widget/table.dart';
import 'ajoutercorpus.dart';
import 'listing2.dart';


class HomeAppercu extends StatefulWidget {
  const HomeAppercu({super.key});

  @override
  State<HomeAppercu> createState() => _HomeAppercuState();
}

class _HomeAppercuState extends State<HomeAppercu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  
    return Scaffold(  
      backgroundColor: Colors.white, 
        body: 
        Stack(children: [PreferredSize(
        preferredSize: Size(width, height/13 ),
        child: Row(children:<Widget> [

              Expanded(child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 50, 0),
              child: Container(
              width: width/2,
              height: 45,
              color: Colors.white,
              child:Row(
              children: [
                Expanded(child:  Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 2.0,
                  child:  

                  FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 144, 185, 218),
                  foregroundColor: const Color.fromARGB(255, 20, 60, 92),
                  onPressed: () {
                    
                  setState(() {
                    Get.to(() => const AjoutCorpus());
                          });
                          },
                  child: const Icon(Icons.add),),),),

                  Expanded(child:  Align(
                  alignment: Alignment.centerLeft ,
                  widthFactor: 2.0,
                  child:  
                  FloatingActionButton(
                  backgroundColor:const Color.fromARGB(255, 222, 224, 158),
                  foregroundColor: const Color.fromARGB(255, 238, 245, 35),
                     onPressed: () {
                          setState(() {
                           });},
                      child: const Icon(Icons.update)), ),),

                      Expanded(child:   Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 2.0,
                      child:  
                      FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 233, 163, 158),
                      foregroundColor: Colors.red,
                        onPressed: () {
                               setState(() {
                               });},
                        child: const Icon(Icons.delete))),),

                        Expanded(child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 2.0,
                        child:  
                        FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 190, 231, 192),
                        foregroundColor: const Color.fromARGB(255, 44, 184, 48),
                        onPressed: () {
                               setState(() {
                               });},
                        child: const Icon(Icons.sort_by_alpha))),),

                        Expanded(child:  Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 2.0,
                        child:  
                        FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 144, 185, 218),
                        foregroundColor: const Color.fromARGB(255, 20, 60, 92),
                        onPressed: () {
                               setState(() {
                               });},
                        child: const Icon(Icons.search_sharp))),),
                     
                       Container(
                       width: width/6,
                       height: 50,
                       color: const Color.fromRGBO(255, 255, 255, 1),
                      child: 
                        TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                        color: Color.fromARGB(255, 18, 31, 61), fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 3, left: 9),
                        prefixIcon: const Icon(Icons.search, ),
                        hintText: "Rechercher Simple",
                        hintStyle:
                        const TextStyle(color: Color.fromRGBO(191, 191, 192, 1)),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                        color: Color.fromRGBO(196, 216, 241, 1), width: 1)),),),

                     ),],),),)),

              const SizedBox(width: 60,),

                    Expanded(child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                    child: Container(
                    width: width/2,
                    height: 45,
                    decoration: const BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color.fromARGB(255, 19, 57, 89),
                  Color.fromARGB(255, 255, 255, 255),], )),

                   child:Row(children: [
                   Expanded(child: Padding(
                   padding: const EdgeInsets.only(left: 0),
                   child: TextButton(
                   onPressed: () 
                   { 
                    Get.to(()=>const Corpus());
                      },
                                   
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(   
                    (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 9, 30, 47);}
                    return Colors.white; }),),
                    child:const Align(
                    alignment: Alignment.center,
                    child:  Text("Information",
                    style: TextStyle(
                    fontFamily: 'Andalus',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    )),),),),),

                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: TextButton(
                    onPressed: ()
                     { 
                      Get.to(()=>const ListingCorpus());
                      },
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>( 
                    (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 9, 30, 47);}
                    return Colors.white;}),),
                    child:const Align(alignment: Alignment.center,
                    child:  Text("Apperçu",
                    style: TextStyle(
                    fontFamily: 'Andalus',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,)),),),),)  
                ]),))),
          ],)),

       const DataTable2SimpleDemo(),

       const SizedBox(width: 3,),
       
            Padding(
            padding: const EdgeInsets.fromLTRB(1030, 100, 10, 60),
            child: Column(children: 
            const [
            Appercu(), ],),),                ]
          ));
      }}
      
          
 

     
