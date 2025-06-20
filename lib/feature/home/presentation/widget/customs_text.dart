import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';

class CustomsText extends StatelessWidget {
  final String text;
  final double size;
  const CustomsText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context: context, fontSize: size),
      ),
    );
  }
}
