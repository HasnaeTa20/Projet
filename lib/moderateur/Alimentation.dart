
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projet_pfe/user/Connexion.dart';
import 'package:projet_pfe/widget/updatealimentation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/usercontroller.dart';

class Alimentation extends StatefulWidget {
  const Alimentation({super.key});

  @override
  State<Alimentation> createState() => _AlimentationState();
}

class _AlimentationState extends State<Alimentation> {
    var formKey=GlobalKey<FormState>();
    final contr = Get.put(UserController());
    bool val=false;
    int val1= -1;
    // String username = "";
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

   
  
 
  // Future logOut(BuildContext context)async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove('username');
  //   Fluttertoast.showToast(
  //       msg: "Logout Successful",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.amber,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Connexion(),),);
  // }


  // @override
  // void initState() {
  //   super.initState();
  //   getEmail();
  // }

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
              actions:[

                 Row(
              children: [
                // Center(child: username == '' ? Text('') : Text(username)),
               SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 10, 50),
                  child: TextButton(
                    onPressed: () {
                      // logOut(context);
                      },
                   style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                
                                (Set<MaterialState> states) {
                  
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromARGB(255, 80, 139, 188);
                                }
                                return  Color.fromARGB(255, 30, 80, 121); // null throus error in flutter 2.2+.
                                   }),
                                   ),
                    child: const Text(
                      'Deconnexion',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 80, 121), 
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Andalus',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
               
                const SizedBox(
                  width: 10,
                ),
                // const CircleAvatar(
                //   radius: 25,
                //  child: Image(image:AssetImage('user.png')),
                // )
              ],
            ),
              ],

                //lien de navigation Home_Corpus_Alimentation
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     //Home  
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 200,150,100),
                        child:   
                          TextButton(
                            onPressed: () {  },
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 80, 139, 188);}
                                return  const Color.fromARGB(255, 11, 55, 91); }), ),

                                child:  const Text("Home",
                                  style: TextStyle(
                                  fontFamily: 'Andalus',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,)),),),

                    //Corpus  
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 200,0.1,100),
                        child: 
                          TextButton(
                            onPressed: () {  },
                            style: ButtonStyle(                
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 80, 139, 188);}
                                return const Color.fromARGB(255, 11, 55, 91); }),),

                                child:  const Text("Corpus",
                                  style: TextStyle(
                                  fontFamily: 'Andalus',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,  )),),),
                    //Alimentation  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 200,0,100),
                          child: 
                            DropdownButton(
                              hint: 
                                const Text("Alimentation",
                                style: TextStyle(
                                fontFamily: 'Andalus',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color.fromARGB(255, 11, 55, 91),)),

                                value: valueChoose,
                                onChanged: (newValue){

                                    setState(() {
                                     valueChoose = newValue; });},

                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                       value: valueItem,
                                       child: Text(valueItem), );
                 
                                 }).toList(),
                                 onTap: (){ },  
                                  ),),
                               ]),),


                     body:Stack(children: <Widget> [

                      Padding(
                        padding: const EdgeInsets.only(top:60,left: 80),
                         child:
                          Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                                  TextButton(
                                    onPressed: ()async{await contr.addUser();},
                                     style: TextButton.styleFrom(
                                     backgroundColor: const Color.fromARGB(255, 11, 55, 91),),
                                     child: const Text('Enregistrer',
                                     style:TextStyle(
                                     color: Colors.white,
                                     fontSize: 20,
                                     fontFamily:'Andalus', ),),),
               
                                  TextButton(
                                    onPressed: ()async{contr.Annuler();},
                                     style: TextButton.styleFrom(
                                     backgroundColor: const Color.fromARGB(255, 213, 37, 219), ),
                                     child: const Text('Annuler',
                                     style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 20,
                                     fontFamily:'Andalus',),),)
          
                              ],),),

                              //formulaire nom/prenom
          
                      Padding(
                        padding: const EdgeInsets.only(top:60,left: 10),
                         child:
                          Column(
                            key: formKey,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                               padding: const EdgeInsets.only(left:15,right: 15,top: 20),
                                child:        
                                 TextFormField(
                                  validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom ":null,
                                  controller: contr.nomtext ,
                                  decoration: const InputDecoration.collapsed(
                                  hintText: "nom",),),),
                          
                              Padding(
                               padding: const EdgeInsets.all(20.0),
                                child: 
                                 TextFormField(
                                  validator:(val)=> val  == "" ?"s'il vous plaît ecrire votre nom ":null,
                                  controller:contr.prenomtext,
                                  decoration: const InputDecoration.collapsed(
                                  hintText: "prenom",),),),

                        //table d'affichage
                      Expanded( 
                       child: Obx(() {
                       final user= contr.contactants;
                       return 
                         SingleChildScrollView( 
                            scrollDirection: Axis.vertical,   
                            child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:
                             Padding(
                              padding: const EdgeInsets.fromLTRB(50, 50, 50, 100),
                              child: 
                              DataTable(   
                                columnSpacing: 150,
                                border: 
                                const TableBorder(
                                  top: BorderSide(width: 2, color: Color.fromARGB(255, 128, 165, 210)),
                                  bottom: BorderSide(width: 2, color:Color.fromARGB(255, 128, 165, 210)),
                                  verticalInside: BorderSide(width: 2,color: Color.fromARGB(255, 128, 165, 210)),
                                  right: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)),
                                  left: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)), ),
                  
                                columns: const [
                                 DataColumn(
                                   label: Text("Nom",
                                   style: TextStyle(
                                   color: Color.fromARGB(255, 10, 41, 96),
                                   fontSize: 20,
                                   fontFamily:'Andalus',),
                                   textAlign: TextAlign.center,),),

                                  DataColumn(
                                    label: Text("Prenom",
                                    style:TextStyle(
                                    color: Color.fromARGB(255, 10, 41, 96),
                                    fontSize: 20,
                                    fontFamily:'Andalus',) ,
                                    textAlign: TextAlign.center,),),

                                  DataColumn(
                                    label: Text('',),),

                                  DataColumn(
                                    label: Text(''),), 
                                  ],

                                rows: user.map((user)  =>
                                  DataRow(cells:[
                                   DataCell(
                                    Text(user.nom!),),

                                   DataCell(
                                    Text(user.prenom!),),
                       
                                   DataCell(
                                    CircleAvatar(
                                     radius: 20,
                                     backgroundColor:  const Color.fromARGB(255, 160, 248, 149),
                                     child:  IconButton(icon: const Icon(Icons.edit,color: Colors.green),
                                     onPressed: () async{  
                                     showDialog(
                                      context: context, 
                                      builder: (context)=>Dialog(child:UpdateUseer(user: user,) ,));
                                      contr.editnomtext.text=user.nom!;
                                      contr.editprenomtext.text=user.prenom!;
                                      contr.update(); },),),),

                                   DataCell(
                                    CircleAvatar(
                                     radius: 20,
                                     backgroundColor: const Color.fromARGB(255, 233, 163, 158),
                                     child: IconButton(icon: const Icon(Icons.delete,color: Colors.red,),
                                     onPressed: () async{ 
                                     contr.deleteUser(user.id.toString());
                                     contr.update(); },),),),

                                   ]),).toList(),
                                  ), )));}),),

                      ],),),       
    ],));      
}}

         
