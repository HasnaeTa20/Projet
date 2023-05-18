import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
 
  final String text;

  const InfoText({super.key,  required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 42, 84, 182),
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
