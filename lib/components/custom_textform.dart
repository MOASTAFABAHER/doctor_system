import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String lable;
  final bool isPassword;
  final TextEditingController controller;

  CustomTextForm(
      {required this.lable, this.isPassword = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            label: Text(
              '$lable',
            )),
      ),
    );
  }
}
