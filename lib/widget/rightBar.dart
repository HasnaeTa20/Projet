// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:projet_pfe/widget/rightColumn.dart';
import 'information.dart';

// ignore: camel_case_types
class rightBar extends StatelessWidget {
  const rightBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
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
          offset: Offset(0, 0),  ),],
          color:Colors.white, ),
        
      padding: const EdgeInsets.fromLTRB(50, 80, 40, 50),
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          InfoText(
          text: 'titre', ),],),
          const Divider(
          color: Color.fromARGB(255, 23, 69, 128),),
          for(int i=1;i<=10;i++) 
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
            const rightColumn(
            heading: 'Key',
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
            InfoText(
            text: 'value',
            ), ],),],),

     const SizedBox(height: 20),
               
        Expanded(child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 39, 210, 45),),
          child: const Text(
            'Télécharger',
             style: TextStyle(
             color: Colors.white,
             fontSize: 20,
             fontFamily:'Andalus',),)
             )),], ),
      )
    );
  }
}
