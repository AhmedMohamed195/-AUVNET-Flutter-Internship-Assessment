import 'package:flutter/cupertino.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories1_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories2_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/cart.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/categories.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/deliver.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/home.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/profile.dart';

// For bottom navigation bar:-
final List<Map<String, dynamic>> navItems = [
  {
    "icon": Image.asset(AppImages.image18, width: 30, height: 40),
    "label": "Home",
    "widget": HomePage(),
  },
  {
    "icon": Image.asset(AppImages.image19, width: 24, height: 24),
    "label": "Categories",
    "widget": CategoriesPage(),
  },
  {
    "icon": Image.asset(AppImages.image20, width: 24, height: 24),
    "label": "Deliver",
    "widget": DeliverPage(),
  },
  {
    "icon": Image.asset(AppImages.image21, width: 24, height: 24),
    "label": "Cart",
    "widget": CartPage(),
  },
  {
    "icon": Image.asset(AppImages.image22, width: 24, height: 24),
    "label": "Profile",
    "widget": ProfilePage(),
  },
];

// For Categories One :-
final List<Categories1> categoriesDataOne = [
  Categories1(image: AppImages.image3, text1: "Up to 50%", text2: "Food"),
  Categories1(
    image: AppImages.image4,
    text1: "20mins",
    text2: "Health & \nwellness",
  ),
  Categories1(image: AppImages.image5, text1: "15 mins", text2: "Groceries"),
];

// For Categories Two :-
final List<Categories2> categoriesDataTwo = [
  Categories2(
    image1: AppImages.image7,
    image2: AppImages.image7,
    text: "Past\norders",
    width1: 0.07,
    height1: 0.07,
    width2: 0.07,
    height2: 0.07,
    fit1: BoxFit.contain,
    fit2: BoxFit.contain,
  ),
  Categories2(
    image1: AppImages.image8,
    image2: AppImages.image9,
    text: "Super\nSaver",
    width1: 0.15,
    height1: 0.055,
    width2: 0.2,
    height2: 0.02,
    fit1: BoxFit.fill,
    fit2: BoxFit.contain,
  ),
  Categories2(
    image1: AppImages.image10,
    image2: AppImages.image9,
    text: "Must-tries",
    width1: 0.1,
    height1: 0.05,
    width2: 0.2,
    height2: 0.02,
    fit1: BoxFit.fill,
    fit2: BoxFit.contain,
  ),
  Categories2(
    image1: AppImages.image11,
    image2: AppImages.image11,
    text: "Give Back",
    width1: 0.07,
    height1: 0.07,
    width2: 0.07,
    height2: 0.07,
    fit1: BoxFit.contain,
    fit2: BoxFit.contain,
  ),
  Categories2(
    image1: AppImages.image12,
    image2: AppImages.image12,
    text: "Best\nSellers",
    width1: 0.07,
    height1: 0.07,
    width2: 0.07,
    height2: 0.07,
    fit1: BoxFit.contain,
    fit2: BoxFit.contain,
  ),
];

// For slider Images :-
final List<String> sliderImages = [
  AppImages.image13,
  AppImages.image13,
  AppImages.image13,
  AppImages.image13,
];

// For Categories Three :-
final List<Categories3> categoriesDataThree = [
  Categories3(
    image: AppImages.image14,
    text1: "Allo Beirut ",
    text2: "32 mins",
  ),
  Categories3(image: AppImages.image15, text1: "Laffah", text2: "38 mins"),
  Categories3(
    image: AppImages.image16,
    text1: "Falafil Al",
    text2: "Rabiah Al kha...",
  ),
  Categories3(image: AppImages.image17, text1: "Barbar", text2: ""),
];
