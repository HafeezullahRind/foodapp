import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final String? Function(String?)? validator; // Validation function

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.onChanged,
    this.obscureText = false, // Default value for obscureText
    this.validator, // Pass the validation function
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
          child: TextFormField( // Use TextFormField instead of TextField
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: icon,
            ),
            validator: validator, // Set the validator
          ),
        ),
      ],
    );
  }
}
