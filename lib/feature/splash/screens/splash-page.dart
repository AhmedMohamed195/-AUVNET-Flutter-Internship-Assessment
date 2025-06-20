import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/main-page.dart';
import 'package:simple_e_commerce_app/feature/on_boarding/presentation/screens/on-boardind-page.dart';
import 'package:simple_e_commerce_app/feature/splash/presentation/bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<SplashBloc>().add(CheckAuthEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) =>  MainPage()),
            );
          } else if (state is SplashNavigateToOnboarding) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) =>  OnboardingPage()),
            );
          }
        },
        child: Center(
          child: Image.asset(
            AppImages.splash,
            width: screenWidth * 0.65,
            height: screenHeight * 0.7,
          ),
        ),
      ),
    );
  }
}
