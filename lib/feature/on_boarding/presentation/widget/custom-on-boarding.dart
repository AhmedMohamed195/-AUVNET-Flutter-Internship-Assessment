import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';

class CustomOnboarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onNextTap;
  const CustomOnboarding({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * -0.3,
            left: screenWidth * -0.8,
            child: Image.asset(AppImages.onBoarding1, width: screenWidth * 2),
          ),
          Positioned(
            top: screenHeight * 0.12,
            left: screenWidth * 0.05,
            child: Image.asset(
              AppImages.onBoarding2,
              width: screenWidth * 0.85,
              height: screenHeight * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * -0.006,
            right: MediaQuery.of(context).size.width * -0.08,
            child: Image.asset(
              AppImages.onBoarding3,
              width: screenWidth * 0.7,
              height: screenHeight * 0.35,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveFontSize(
                      context: context,
                      fontSize: getResponsiveFontSize(
                        context: context,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(
                      context: context,
                      fontSize: 16,
                    ),
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  width: screenWidth * 0.77,
                  height: screenHeight * 0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff8900FE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(
                        context: context,
                        fontSize: getResponsiveFontSize(
                          context: context,
                          fontSize: 18,
                        ),
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                  onTap: onNextTap,
                  child: Text(
                    'next',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        fontSize: 16,
                        context: context,
                      ),
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
