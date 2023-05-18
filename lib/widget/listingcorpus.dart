
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_pfe/moderateur/Alimentation.dart';
import 'package:projet_pfe/widget/ajoutercorpus.dart';
import 'package:projet_pfe/widget/home.dart';


class Corpus extends StatefulWidget {
  const Corpus({super.key});

  @override
  State<Corpus> createState() => _CorpusState();
}

class _CorpusState extends State<Corpus> {
  bool val=false;
  int val1= -1;
   
  var valueChoose;
  List listItem = [
     
       
    'Categorie Corpus',
    'Genre',
    'Type',
    'Ariste',
    'Catgorie Artiste',
    'Rapporteur',
    'Contractant',
    'Langue',
    'Variante',
    
    
  ];
  @override
  Widget build(BuildContext context) {
  
    return 
      Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //banière
         flexibleSpace:
              const Expanded(child: Image(image: AssetImage('banner.png'),
              height: 150,
              width: 150,
              fit: BoxFit.cover,),),
                //lien de navigation Home_Corpus
              title: Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [

                   Padding(
                    padding: const EdgeInsets.fromLTRB(150, 200,150,100),
                    child: 
                    TextButton(
                     onPressed: ()
                      { 
                          setState(() {
                    Get.to(() => const Corpus());
                          }); 
                 
                      },
                     style: ButtonStyle(
                     foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(255, 80, 139, 188);}
                      return  const Color.fromARGB(255, 11, 55, 91);}),
                      ),
                      child:  const Text("Home",
                       style: TextStyle(
                       fontFamily: 'Andalus',
                       fontWeight: FontWeight.bold,
                       fontSize: 25,  )),),   ),


                    Padding(
                     padding: const EdgeInsets.fromLTRB(0, 200,0.1,100),
                     child: TextButton(
                     onPressed: () { 
                       setState(() {
                    Get.to(() => const AjoutCorpus());
                          }); },
                     style: ButtonStyle(    
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(255, 80, 139, 188);}
                      return const Color.fromARGB(255, 11, 55, 91);}), ),
                      child:  const Text("Corpus",
                           style: TextStyle(
                           fontFamily: 'Andalus',
                          fontWeight: FontWeight.bold,
                         fontSize: 25,)),),),


                        Padding(
                         padding: const EdgeInsets.fromLTRB(120, 200,0,100),
                         child: DropdownButton(
                         hint: const Text("Alimentation",
                               style: TextStyle(
                                fontFamily: 'Andalus',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color.fromARGB(255, 11, 55, 91),)),
                                value: valueChoose,
                                onChanged: (newValue)
                                {
                               setState(() {
                               valueChoose = newValue;
                               Get.to(() => const Alimentation());
                               });},
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                               value: valueItem,
                               child: Text(valueItem),);
                              }).toList(),
                             onTap: ()
                              {
                               },
                               ) ,),
                       ]),
                     ),
      body: 
      const Home(),
           ); 
  }}

         
