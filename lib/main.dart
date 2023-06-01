import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projet_pfe/moderateur/Alimentation.dart';

import 'package:projet_pfe/user/Connexion.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ircamCorpus',
      debugShowCheckedModeBanner: false,
      home:
      FutureBuilder(
        builder: (context, dataSnapshot){
         return
          const Alimentation();
          },
       ) 
    );
}}

