
import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       color: Color(0xff8900FE)
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 17),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
