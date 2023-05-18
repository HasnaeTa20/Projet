import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DataTable2SimpleDemo extends StatelessWidget {
  
  const DataTable2SimpleDemo({super.key});
 

  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: const EdgeInsets.fromLTRB(50, 100, 903, 50),
      child: 
      DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 200,
          border: const TableBorder(
          top: BorderSide(width: 2, color: Color.fromARGB(255, 128, 165, 210)),
          bottom: BorderSide(width: 2, color:Color.fromARGB(255, 128, 165, 210)),
          verticalInside: BorderSide(width: 2,color: Color.fromARGB(255, 128, 165, 210)),
          right: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)),
          left: BorderSide(width:2, color: Color.fromARGB(255, 128, 165, 210)),),
          
          columns: const [
            DataColumn2(
              label: Text('Corpus'),
              size: ColumnSize.M,),
            DataColumn(
              label: Text('Categorie'),),
            DataColumn(
              label: Text('Genre'), ),
            DataColumn(
              label: Text('Type'),),
            DataColumn(
              label: Text('Date de Création'),),
             DataColumn(
              label: Text('Action'),),
          ],
          
         rows:List<DataRow>.empty()
          
         
          
    ));
  }
}

