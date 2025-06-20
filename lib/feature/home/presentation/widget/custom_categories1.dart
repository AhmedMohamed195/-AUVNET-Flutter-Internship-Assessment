import 'package:flutter/material.dart';

class CustomCategoriesOne extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  const CustomCategoriesOne({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
            ),
            height: screenHeight * 0.08,
            width: screenWidth * 0.27,

            child: Image.asset(image),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff8900FE),
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
            ),
            height: screenHeight * 0.025,
            width: screenWidth * 0.18,

            child: Center(
              child: Text(text1, style: TextStyle(color: Colors.white)),
            ),
          ),
          Text(
            text2,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
