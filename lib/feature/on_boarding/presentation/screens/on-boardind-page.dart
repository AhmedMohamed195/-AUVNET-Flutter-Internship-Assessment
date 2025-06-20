import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
import 'package:simple_e_commerce_app/feature/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:simple_e_commerce_app/feature/on_boarding/presentation/widget/custom-on-boarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'all-in-one delivery ',
      'subtitle':
          'Order groceries, medicines, and meals delivered straight to your door.',
    },
    {
      'title': 'User-to-User Delivery',
      'subtitle': 'Send or receive items from other users quickly and easily',
    },
    {
      'title': 'Sales & Discounts',
      'subtitle': 'Discover exclusive sales and deals every day',
    },
  ];

  void _handleNextTap(BuildContext context) {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.read<OnBoardingBloc>().add(OnBoardingNavigate());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingNavigateToLogin) {
          Navigator.of(context).pushReplacementNamed(RouteNames.signInScreen);
        }
      },
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return CustomOnboarding(
                title: data['title']!,
                subtitle: data['subtitle']!,
                onNextTap: () => _handleNextTap(context),
              );
            },
          ),
          BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              if (state is OnBoardingLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
