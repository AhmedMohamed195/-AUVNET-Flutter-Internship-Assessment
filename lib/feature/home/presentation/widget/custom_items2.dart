import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';

class CustomItemsTwo extends StatelessWidget {
  const CustomItemsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
          ),

          height: screenHeight * 0.125,
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Row(
            children: [
              Image.asset(AppImages.image6),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Got a code !",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getResponsiveFontSize(
                          context: context,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Text(
                      "Add your code and save on your",
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontSize: getResponsiveFontSize(
                          context: context,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Text(
                      "order",
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontSize: getResponsiveFontSize(
                          context: context,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
