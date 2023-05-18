import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
        Container(
        child: 
        Column(
         children: const <Widget>[
         Padding(
          padding: EdgeInsets.only(top:90),
          child: NavBarWidget(),),
        // Padding(
        //   padding: EdgeInsets.only(left:20),
        //   child: MainContent(),),
         ],
      ),
    ) );
  }
}

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  bool val=false;
  int val1= -1;
  var valueChoose;
  List listItem = [
    'Image',
  ];
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 50,
      child: Row(children:<Widget>[
        Padding(
        padding: const EdgeInsets.only(left: 20),
        child: 
        Radio(value: 1, groupValue:val1, onChanged: (value){
        setState(()
         {
              val1= value!;
           }); },
        activeColor: Colors.blue,),),
        const Text('Document'),
 
        Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Radio(value: 0, groupValue:val1, onChanged: (value){
        setState(() 
         {
             val1= value!;
           });},
        activeColor: Colors.blue,),),
        const Text('Védio'),
               
        Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Radio(value: 0, groupValue:val1, onChanged: (value){
        setState(() 
         {
         val1= value!;
         }); },
        activeColor: Colors.blue,),),
        const Text('Audio'),

       Padding(
       padding: const EdgeInsets.only(left: 30),
       child: DropdownButton(
        hint: const Text('Autre'),
       value: valueChoose,
       onChanged: (newValue){
       setState(()
        {
           valueChoose = newValue;
         }); },
        icon: const Icon(Icons.keyboard_arrow_down),
        items: listItem.map((valueItem) {
        return DropdownMenuItem(value: valueItem,
        child: 
        Text(valueItem));
        }).toList(),),),      
        ]),);
  
  }
}

