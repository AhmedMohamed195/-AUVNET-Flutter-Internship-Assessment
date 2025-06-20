import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/feature/home/data/dummy_data.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({super.key});

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _sliderTimer;

  @override
  void initState() {
    super.initState();
    _sliderTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _sliderTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.2,
          width: screenWidth * 0.9,
          child: PageView.builder(
            controller: _pageController,
            itemCount: sliderImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                child: Image.asset(
                  sliderImages[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(sliderImages.length, (index) {
            final bool isActive = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              width: isActive ? screenWidth * 0.03 : screenWidth * 0.02,
              height: screenHeight * 0.01,
              decoration: BoxDecoration(
                color: isActive ? Color(0xff8900FE) : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
            );
          }),
        ),
      ],
    );
  }
}
