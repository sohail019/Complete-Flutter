import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<dynamic> state) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'full name',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
