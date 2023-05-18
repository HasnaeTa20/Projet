import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projet_pfe/api/connection.dart';
import 'package:projet_pfe/moderateur/Alimentation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfe/widget/Formulaire.dart';
import 'package:projet_pfe/widget/NavBar.dart';

class AjoutCorpus extends StatefulWidget {
  const AjoutCorpus({super.key});

  @override
  State<AjoutCorpus> createState() => _AjoutCorpusState();
}

class _AjoutCorpusState extends State<AjoutCorpus> {
  bool val=false;
  int val1= -1;
  List<int>? _selectedFile;
  Uint8List? _bytesData;
  var name;

   
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



  
     startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    // uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.accept = '.png,.jpg';
    uploadInput.accept = 'image/*,.mp4,.pdf,.mp3';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        name=file.name;
                 print(name);
        setState(() {
          _bytesData =
          Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
        });
      });
      reader.readAsDataUrl(file);
    });
 }

  Future uploadImage() async {
    var url = Uri.parse(API.savemedia);
    var request = http.MultipartRequest("POST", url);
    request.files.add(await http.MultipartFile.fromBytes(
    'my_video', _selectedFile!,
    contentType: MediaType('image', 'png'),filename:name ));
    request.send().then((response) {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Corpus ajouter avec succès.");
        print("File uploaded successfully");
      } else {
        Fluttertoast.showToast(msg: "l'ajout du Corpus a échoué");
        print('file upload failed');
      }
     }
     );
  }
 
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                     onPressed: () {  },
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
                     onPressed: () {  },
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

        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            // first half of page
            Expanded(
            flex: 2,
            child: Column(
            children: [
              const NavBarWidget(),
              ElevatedButton
              (onPressed: () 
               {
                startWebFilePicker();   
              }, child: const Text('Choisir un fichier'), 
              ),
              MaterialButton
              (onPressed: () 
              {
                uploadImage();
              },
              child: const Text('Enregistrer'),),

               // list of textfiel and dropdown
                  
              Expanded(
                child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                return const 
                TitleSelect();   
                },  ),),],), ),

            // second half of page
            Expanded(
            child: Column(
            children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(  
            height:80,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
            Color.fromARGB(255, 19, 57, 89),
            Color.fromARGB(255, 255, 255, 255),],)),
            child:Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text('Apperçu',
                style: TextStyle(
                fontFamily: 'Andalus',
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold, ), ),  )])),),
                _bytesData != null
                ? 
                Image.memory(_bytesData!, width: 400, height: 400)
                  // champ vide
                : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                    Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200]),  ),),), ], ),),],
        ),
      ), 
  );
 
  }
}