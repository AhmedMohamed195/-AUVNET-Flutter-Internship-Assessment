import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';

class CustomCategoriesTwo extends StatelessWidget {
  final String image1;
  final String image2;
  final String text;
  final double width1;
  final double height1;
  final double width2;
  final double height2;
  final BoxFit fit1;

  final BoxFit fit2;

  const CustomCategoriesTwo({
    super.key,
    required this.image1,
    required this.image2,
    required this.text,
    required this.width1,
    required this.height1,
    required this.width2,
    required this.height2,
    required this.fit1,
    required this.fit2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.013),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFFEEE6),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
            ),
            width: screenWidth * 0.165,
            height: screenHeight * 0.08,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  image1,
                  width: screenWidth * width1,
                  height: screenHeight * height1,
                  fit: fit1,
                ),
                Image.asset(
                  image2,
                  width: screenWidth * width2,
                  height: screenHeight * height2,
                  fit: fit2,
                ),
              ],
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 13),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
