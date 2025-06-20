import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';

class CustomsItemsOne extends StatelessWidget {
  const CustomsItemsOne({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivering to",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveFontSize(context: context, fontSize: 13),
              ),
            ),

            Text(
              "Al Satwa, 81A Street",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveFontSize(context: context, fontSize: 15),
              ),
            ),

            Text(
              "Hi hepa! ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveFontSize(context: context, fontSize: 25),
              ),
            ),
          ],
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: screenWidth * 0.15,
              height: screenHeight * 0.07,
              child: Image.asset(AppImages.image2),
            ),

            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.signInScreen,
                  (route) => false,
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: screenWidth * 0.055,
              ),
              constraints: BoxConstraints(
                minHeight: screenHeight * 0.04,
                minWidth: screenWidth * 0.04,
              ), 
            ),
          ],
        ),
      ],
    );
  }
}
