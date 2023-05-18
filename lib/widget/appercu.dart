
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Appercu extends StatelessWidget {
  const Appercu({ Key? key,}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
 
    return 
     Expanded(child:
     Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color.fromARGB(255, 58, 117, 162),
          blurRadius: 10,
          spreadRadius: 0,
          offset: Offset(0, 0), ),],
          color:Colors.white ),
     ));
     
  }
}
