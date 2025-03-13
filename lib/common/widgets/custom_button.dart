import 'package:e_comm/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onTap;
  const CustomButton(
      {this.color, super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              color: color == null ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor:
                color == null ? GlobalVariables.secondaryColor : color,
            minimumSize: Size(double.infinity, 50)));
  }
}
