import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_categories1.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_categories2.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_categories3.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_items1.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_items2.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/custom_siderwidget.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/widget/customs_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.18,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.image1),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenHeight * 0.035,
              ),
              child: const CustomsItemsOne(),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.012,
              ),
              children: [
                // First Text
                CustomsText(
                  text: "Services:",
                  size: getResponsiveFontSize(context: context, fontSize: 20),
                ),
                SizedBox(height: screenHeight * 0.018),

                // BlocBuilder for Categories One
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return SizedBox(
                        height: screenHeight * 0.182,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cat1.length,
                          itemBuilder: (context, i) {
                            final item = state.cat1[i];
                            return CustomCategoriesOne(
                              image: item.image,
                              text1: item.text1,
                              text2: item.text2,
                            );
                          },
                        ),
                      );
                    } else if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(
                        child: Text("Error loading categories"),
                      );
                    }
                  },
                ),

                SizedBox(height: screenHeight * 0.009),
                const CustomItemsTwo(),

                // Second Text
                CustomsText(
                  text: "Shortcuts:",
                  size: getResponsiveFontSize(context: context, fontSize: 20),
                ),
                SizedBox(height: screenHeight * 0.018),

                // BlocBuilder for Categories Two
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return SizedBox(
                        height: screenHeight * 0.14,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cat2.length,
                          itemBuilder: (context, i) {
                            final item = state.cat2[i];
                            return CustomCategoriesTwo(
                              image1: item.image1,
                              image2: item.image2,
                              text: item.text,
                              width1: item.width1,
                              height1: item.height1,
                              width2: item.width2,
                              height2: item.height2,
                              fit1: item.fit1,
                              fit2: item.fit2,
                            );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

                SizedBox(height: screenHeight * 0.018),
                const CustomSliderWidget(),
                SizedBox(height: screenHeight * 0.025),

                // Third Text
                CustomsText(
                  text: "Popular restaurants nearby",
                  size: getResponsiveFontSize(context: context, fontSize: 18),
                ),
                SizedBox(height: screenHeight * 0.018),

                // BlocBuilder for Categories Three
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return SizedBox(
                        height: screenHeight * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cat3.length,
                          itemBuilder: (context, i) {
                            final item = state.cat3[i];
                            return CustomCategoriesThree(
                              image: item.image,
                              text1: item.text1,
                              text2: item.text2,
                            );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
