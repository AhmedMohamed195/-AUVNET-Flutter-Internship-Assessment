// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
import 'package:simple_e_commerce_app/core/components/custom-button.dart';
import 'package:simple_e_commerce_app/core/components/customtextformfield-1.dart';
import 'package:simple_e_commerce_app/core/components/customtextformfield-2.dart';
import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/bloc/sign_up_bloc.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/bloc/sign_up_event.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/bloc/sign_up_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: state.message,
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (state is SignUpSuccess) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(RouteNames.signInScreen, (route) => false);
        }
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: screenHeight,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.06),
                  SizedBox(
                    height: screenHeight * 0.37,
                    width: screenWidth * 0.8,
                    child: Image.asset(AppImages.signup),
                  ),
                  CustomTextFormFieldOne(
                    hinttext: "mail",
                    mycontroller: email,
                    validator: (val) {
                      if (val == "") {
                        return "Can't To be Empty";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldTwo(
                    hinttext: "password",
                    mycontroller: password,
                  ),

                  CustomTextFormFieldTwo(
                    hinttext: "confirm password",
                    mycontroller: confirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.013),

                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return const CircularProgressIndicator();
                      }
                      return CustomButton(
                        text: "Sign up ",
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.063,
                        onPressed: () {
                          BlocProvider.of<SignUpBloc>(context).add(
                            SignUpButtonPressed(
                              email: email.text,
                              password: password.text,
                              confirmPassword: confirmPassword.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " Have An Account ?",
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context: context,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context: context,
                              fontSize: 17,
                            ),
                            color: Color(0xff1877F2),
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacementNamed(
                                    RouteNames.signInScreen,
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
