
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:projet_pfe/moderateur/Alimentation.dart';
// import 'package:projet_pfe/user/Connexion.dart';
// import 'package:projet_pfe/user/currentuser.dart';
// import 'package:projet_pfe/user/userpreferences.dart';
// import 'package:projet_pfe/widget/ajoutercorpus.dart';
// import 'package:projet_pfe/widget/home.dart';


// class Corpuss extends StatefulWidget {
//   const Corpuss({super.key});

//   @override
//   State<Corpuss> createState() => _CorpusState();
// }

// class _CorpusState extends State<Corpuss> {
//   final CurrentUser currentUser = Get.put(CurrentUser());
//   CurrentUser remmebereCurrentUser = Get.put(CurrentUser());
//   SignOutUser()async{
//    var res= await Get.dialog(
//       AlertDialog(
//         backgroundColor: Color.fromARGB(255, 199, 219, 232),
//       title:  Text("Deconnexion",
//       style: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Andalus',
//       fontWeight: FontWeight.bold),),
//       content: Text(
//         "Êtes-vous sûr? \n de vouloir vous déconnecter? ",
//         style: TextStyle(fontFamily: 'Andalus',
//         fontSize: 16,),
//       ),
//       actions: [
//         TextButton(
//           onPressed:()
//           {
//             Get.back();
//           },
//         child:Text( "Non",
//         style: TextStyle(
//           color: Color.fromARGB(255, 3, 54, 106),
//           fontFamily: 'Andalus',
//           fontSize: 16,

//         ),)
//         ),
//         TextButton(
//           onPressed:()
//           {
//             Get.back(result: "Deconnexion");
//           },
//         child:Text( "Oui",
//         style: TextStyle(
//           color: Color.fromARGB(255, 3, 54, 106),
//           fontFamily: 'Andalus',
//           fontSize: 16,

//         ),)
//         ),
//       ],

//       ));
//       if(res=="Deconnexion"){
//         //delete-remove the user data from local storage
//         RememeberUserPrefs.removeUserInfo().then((value) 
//         {
//           Get.off(const Connexion());
//         });

//       }
//   }
//   bool val=false;
//   int val1= -1;
   
//   var valueChoose;
//   List listItem = [
 
//     'Categorie Corpus',
//     'Genre',
//     'Type',
//     'Ariste',
//     'Catgorie Artiste',
//     'Rapporteur',
//     'Contractant',
//     'Langue',
//     'Variante',
  
//   ];
//   Widget userInfo(String userData){
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.blue,
//       ),
//       padding:const EdgeInsets.symmetric(horizontal: 16,vertical:8,),
//       child:  Row(children: [

//         Text(userData,
//         style: const TextStyle(
//           fontSize: 15,
//         ),),
//       ],),
//     );

//   }
  
//   @override
//   Widget build(BuildContext context) {
  
//     return GetBuilder(init: CurrentUser(),
//     initState: (currentState)
//     {
//       remmebereCurrentUser.getUserInfo();
//     },
//       builder:(controller){
//       return 
//       Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 150,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         //banière
//          flexibleSpace:
//               const Expanded(child: Image(image: AssetImage('banner.png'),
//               height: 150,
//               width: 150,
//               fit: BoxFit.cover,),),
//               actions:[

//                  Row(
//               children: [
                 
//                SizedBox(width: 20,),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(70, 0, 10, 50),
//                   child: Material(
//                     color:  Color.fromARGB(255, 255, 255, 255),
//                     borderRadius: BorderRadius.circular(8),
//                     child: InkWell(
//                       onTap: ()
//                       {
//                         SignOutUser();
//                       },
//                       borderRadius: BorderRadius.circular(10),
//                       child: const Padding(
//                         padding:
//                        EdgeInsets.symmetric(horizontal: 30,
//                       vertical: 12),
//                       child:  Text(
//                       'Deconnexion',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 30, 80, 121), 
//                         fontWeight: FontWeight.w700,
//                         fontFamily: 'Andalus',
//                         fontSize: 16,
//                       ),
//                     ),
//                       ),
//                     )
                  
                    
//                   ),
                  
                 
//                 ),
//                 const SizedBox(
//                   width: 2,
//                 ),
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(30, 0, 5, 50),
//                    child: userInfo(currentUser.user.username),
//                  ),
 
                
//               ],
//             ),
//               ],
//                 //lien de navigation Home_Corpus
//               title: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                 children: [

//                    Padding(
//                     padding: const EdgeInsets.fromLTRB(150, 200,150,100),
//                     child: 
//                     TextButton(
//                      onPressed: ()
//                       { 
//                           setState(() {
//                     Get.to(() => const Corpuss());
//                           }); 
                 
//                       },
//                      style: ButtonStyle(
//                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                       return const Color.fromARGB(255, 80, 139, 188);}
//                       return  const Color.fromARGB(255, 11, 55, 91);}),
//                       ),
//                       child:  const Text("Home",
//                        style: TextStyle(
//                        fontFamily: 'Andalus',
//                        fontWeight: FontWeight.bold,
//                        fontSize: 25,  )),),   ),


//                     Padding(
//                      padding: const EdgeInsets.fromLTRB(0, 200,0.1,100),
//                      child: TextButton(
//                      onPressed: () { 
//                        setState(() {
//                     Get.to(() => const AjoutCorpus());
//                           }); },
//                      style: ButtonStyle(    
//                       foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                       return const Color.fromARGB(255, 80, 139, 188);}
//                       return const Color.fromARGB(255, 11, 55, 91);}), ),
//                       child:  const Text("Corpus",
//                            style: TextStyle(
//                            fontFamily: 'Andalus',
//                           fontWeight: FontWeight.bold,
//                          fontSize: 25,)),),),


//                         Padding(
//                          padding: const EdgeInsets.fromLTRB(120, 200,0,100),
//                          child: DropdownButton(
//                          hint: const Text("Alimentation",
//                                style: TextStyle(
//                                 fontFamily: 'Andalus',
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                                 color: Color.fromARGB(255, 11, 55, 91),)),
//                                 value: valueChoose,
//                                 onChanged: (newValue)
//                                 {
//                                setState(() {
//                                valueChoose = newValue;
//                                Get.to(() => const Alimentation());
//                                });},
//                               icon: const Icon(Icons.keyboard_arrow_down),
//                               items: listItem.map((valueItem) {
//                               return DropdownMenuItem(
//                                value: valueItem,
//                                child: Text(valueItem),);
//                               }).toList(),
//                              onTap: ()
//                               {
//                                },
//                                ) ,),
//                        ]),
//                      ),
//       body: 
      
//       const Home(),
//            );}); 
//   }}

         
