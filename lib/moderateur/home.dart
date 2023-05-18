// // ignore_for_file: prefer_const_constructors

// // import 'dart:convert';


// import 'package:flutter/material.dart';



// import 'package:get/get.dart';
// import 'package:projet_pfe/controller/usercontroller.dart';
// import 'package:projet_pfe/tables/update.dart';


// class CreationArt extends StatefulWidget {
  

//  CreationArt({super.key});

//   @override
//   State<CreationArt> createState() => _CreationArtState();
// }

// class _CreationArtState extends State<CreationArt> {
//   var formKey=GlobalKey<FormState>();
//   final contr = Get.put(UserController());
//   var isObscure=true.obs;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
        
//       body:Stack(children: <Widget> [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
              
             
              
//               TextButton(onPressed: ()async{await contr.addUser();}, child: Text('Enregistrer')),
//               TextButton(onPressed: ()async{contr.Annuler();}, child: Text('Annuler')),

//             ],),
          
//             Column(
      
//         key: formKey,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
          
        
//           Padding(
//             padding: EdgeInsets.all(20.0),
//             child: 
          
//               TextFormField(
              
//               validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom ":null,
//               controller: contr.nomtext ,
//               decoration: InputDecoration.collapsed(
//                 hintText: "nom",
//               ),
//             ),
//           ),
//             Padding(
//             padding: EdgeInsets.all(20.0),
//             child: TextFormField(
//               validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom ":null,
            
//               controller:contr.prenomtext,
//               decoration: InputDecoration.collapsed(
//                 hintText: "prenom",
//               ),
//             ),
//           ),
        
         
          
//            Expanded(
          
//              child: Obx(() {
//             final user= contr.contactants;
           
         
      
//       return SingleChildScrollView(
        
//          scrollDirection: Axis.vertical,
         
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
        
//         child:
//            Padding(
//              padding: const EdgeInsets.fromLTRB(50, 50, 50, 100),
//              child: DataTable(   
//                columnSpacing: 150,
//                     //  horizontalMargin: 12,
                    
//                      border: const TableBorder(
//                      top: BorderSide(width: 2, color: Color.fromARGB(255, 128, 165, 210)),
//                      bottom: BorderSide(width: 2, color:Color.fromARGB(255, 128, 165, 210)),
//                      verticalInside: BorderSide(width: 2,color: Color.fromARGB(255, 128, 165, 210)),
//                      right: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)),
//                      left: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)),
//                      ),
              
//                      columns: const [
//               DataColumn(
//                   label: Text("Nom",
//                   style: TextStyle(
//                      color: Color.fromARGB(255, 10, 41, 96),
//                       fontSize: 20,
//                       fontFamily:'Andalus',
//                   ),
//                   textAlign: TextAlign.center,
//                   ),
//                   ),
//                   DataColumn(
//                   label: Text("Prenom",
//                   style:TextStyle(
//                     color: Color.fromARGB(255, 10, 41, 96),
//                       fontSize: 20,
//                       fontFamily:'Andalus',
           
//                   ) ,
//                     textAlign: TextAlign.center,
                  
//                   ),
           
//                   ),
//                    DataColumn(
//                   label: Text('',
                 
//                   ),
                  
//                   ),
//                     DataColumn(
//                   label: Text(''),
//                   ),
                  
//                   ],
               
           
//                      rows: user
//               .map((user)  =>
//                DataRow(cells:
//                    [
                    
//                     DataCell(
                     
//                        Text(user.nom!),
//                       //  onTap: () {
//                         //  contr.editnomtext.text=user.nom!;
//                         //  contr.editprenomtext.text=user.prenom!;
//                           // contr.showvalues(user);
//                           // select=user.id;
                         
//                         // Get.to(()=>UpdateUseer());
//                         // contr.editnomtext.text=user.nom!;
//                         //  contr.editnomtext.text=user.prenom!;
           
//                     //  },
                     
//                       ),
//                     DataCell(
                     
//                         Text(user.prenom!),
                     
                       
//                       ),
                   
//                         DataCell(
//                           CircleAvatar(
//                   radius: 20,
//                   backgroundColor:  Color.fromARGB(255, 160, 248, 149),
//                       child:  IconButton(icon: Icon(Icons.edit,color: Colors.green
                       
//                           ),
//                          onPressed: () async{  
//                           showDialog(context: context, builder: (context)=>Dialog(child:UpdateUseer(user: user,) ,));
                          
//                           contr.editnomtext.text=user.nom!;
//                           contr.editprenomtext.text=user.prenom!;
//                           contr.update();
//                          },
//                       ),),
//                       ),
//                          DataCell(
//                                CircleAvatar(
//                         radius: 20,
//                          backgroundColor: const Color.fromARGB(255, 233, 163, 158),
//                        child: IconButton(icon: Icon(Icons.delete,color: Colors.red,),
//                          onPressed: () async{  contr.deleteUser(user.id.toString());
//                           contr.update();
//                          },
//                       ),),
//                       ),
                      
                      
//                    ]
//                    ),
//                    )
//                    .toList(),
               
//                  ),
//            )));
//         }
              
//              ),  ),
            





         
//         ],
//       ),
     

    
      
      
                    
//     ],
    
//     )
//     ) ;
//   }
// }














 



  
   



    

