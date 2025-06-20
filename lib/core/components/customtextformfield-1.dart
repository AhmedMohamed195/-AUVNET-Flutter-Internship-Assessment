// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormFieldOne extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  const CustomTextFormFieldOne({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.0060,
      ),
      child: TextFormField(
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.025,
            horizontal: screenWidth * 0.04,
          ),
          hintText: hinttext,
          prefixIcon: Icon(Icons.mail_outline_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
