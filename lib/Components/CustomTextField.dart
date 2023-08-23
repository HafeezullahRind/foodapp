import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final obscureText;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.onChanged,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            onChanged: onChanged, // Call the provided onChanged function
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: icon,
            ),
          ),
        ),
      ],
    );
  }
}
