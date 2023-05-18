
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class rightColumn extends StatelessWidget {
  final String heading;
  
 const rightColumn ({super.key,required this.heading });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              color: Color.fromARGB(255, 23, 42, 111),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
