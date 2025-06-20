// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormFieldTwo extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextFormFieldTwo({
    super.key,
    required this.hinttext,
    required this.mycontroller,
  });

  @override
  State<CustomTextFormFieldTwo> createState() => _CustomTextFormFieldTwoState();
}

class _CustomTextFormFieldTwoState extends State<CustomTextFormFieldTwo> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.006,
      ),
      child: TextFormField(
        obscureText: _isObscured,
        controller: widget.mycontroller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.025,
            horizontal: screenWidth * 0.04,
          ),
          hintText: widget.hinttext,
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
