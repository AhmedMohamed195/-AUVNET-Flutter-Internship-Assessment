// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
// import 'package:simple_e_commerce_app/core/components/custom-button.dart';
// import 'package:simple_e_commerce_app/core/components/customtextformfield-1.dart';
// import 'package:simple_e_commerce_app/core/components/customtextformfield-2.dart';
// import 'package:simple_e_commerce_app/core/helper/getresponsivefontsize.dart';
// import 'package:simple_e_commerce_app/core/utilies/assets/images/app_images.dart';
// import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_bloc.dart';
// import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_state.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   GlobalKey<FormState> key1 = GlobalKey();

//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: BlocListener<SignInBloc, SignInState>(
//         listener: (context, state) {
//           if (state is SignInLoading) {
//             showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) => Center(child: CircularProgressIndicator()),
//             );
//           } else {
//             if (Navigator.of(context).canPop()) {
//               Navigator.of(context).pop();
//             }
//           }

//           if (state is SignInSuccess) {
//             Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
//           } else if (state is SignInFailure) {
//             AwesomeDialog(
//               context: context,
//               dialogType: DialogType.error,
//               animType: AnimType.rightSlide,
//               title: 'Error',
//               desc: state.message,
//               btnCancelOnPress: () {},
//               btnOkOnPress: () {},
//             ).show();
//           } else if (state is ResetPasswordSuccess) {
//             AwesomeDialog(
//               context: context,
//               dialogType: DialogType.success,
//               animType: AnimType.rightSlide,
//               title: 'Check Email',
//               desc: "Please Go TO Email To Make Reset Password",
//               btnCancelOnPress: () {},
//               btnOkOnPress: () {},
//             ).show();
//           }
//         },
//         child: Form(
//           key: key1,
//           child: Container(
//             color: Colors.white,
//             width: double.infinity,
//             height: screenHeight,
//             child: ListView(
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(height: screenHeight * 0.03),
//                     SizedBox(
//                       height: screenHeight * 0.37,
//                       width: screenWidth * 0.8,
//                       child: Image.asset(AppImages.signin),
//                     ),
//                     SizedBox(height: screenHeight * 0.06),

//                     // CustomTextFormField with Email :-
//                     CustomTextFormFieldOne(
//                       hinttext: "mail",
//                       mycontroller: email,
//                       validator: (val) {
//                         if (val == "") {
//                           return "Can't To be Empty";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.01),

//                     // CustomTextFormField with password :-
//                     CustomTextFormFieldTwo(
//                       hinttext: "password",
//                       mycontroller: password,
//                     ),

//                     InkWell(
//                       onTap: () {
//                         if (email.text == "") {
//                           AwesomeDialog(
//                             context: context,
//                             dialogType: DialogType.error,
//                             animType: AnimType.rightSlide,
//                             title: 'Error',
//                             desc:
//                                 "Please Enter Email Then press Forget Password",
//                             btnCancelOnPress: () {},
//                             btnOkOnPress: () {},
//                           ).show();
//                           return;
//                         }

//                         BlocProvider.of<SignInBloc>(
//                           context,
//                         ).add(ResetPasswordRequested(email: email.text));
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(left: screenWidth * 0.53),
//                         child: Text(
//                           "Forget Password?",
//                           style: TextStyle(
//                             fontSize: getResponsiveFontSize(
//                               context: context,
//                               fontSize: 17,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.013),

//                     // Custom Button Login:-
//                     CustomButton(
//                       width: screenWidth * 0.85,
//                       height: screenHeight * 0.063,
//                       text: "Log in",
//                       onPressed: () {
//                         if (key1.currentState!.validate()) {
//                           BlocProvider.of<SignInBloc>(context).add(
//                             SignInButtonPressed(
//                               email: email.text,
//                               password: password.text,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.015),
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Dont have An Account ?",
//                             style: TextStyle(
//                               fontSize: getResponsiveFontSize(
//                                 context: context,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ),
//                           TextSpan(
//                             text: " Register",
//                             style: TextStyle(
//                               fontSize: getResponsiveFontSize(
//                                 context: context,
//                                 fontSize: 17,
//                               ),
//                               color: Color(0xff1877F2),
//                             ),
//                             recognizer:
//                                 TapGestureRecognizer()
//                                   ..onTap = () {
//                                     Navigator.of(
//                                       context,
//                                     ).pushNamed(RouteNames.signUpScreen);
//                                   },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


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
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_bloc.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_state.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/bloc/sign_in_event.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          // Loading
          if (state is SignInLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          }

          // Success
          if (state is SignInSuccess) {
            Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
          }

          // Failure
          if (state is SignInFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: state.message,
              btnOkOnPress: () {},
            ).show();
          }

          // Password Reset
          if (state is PasswordResetSuccess) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Check Email',
              desc: "Please check your email to reset your password.",
              btnOkOnPress: () {},
            ).show();
          }
        },
        child: Form(
          key: formKey,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: screenHeight,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      height: screenHeight * 0.37,
                      width: screenWidth * 0.8,
                      child: Image.asset(AppImages.signin),
                    ),
                    SizedBox(height: screenHeight * 0.06),

                    CustomTextFormFieldOne(
                      hinttext: "mail",
                      mycontroller: email,
                      validator: (val) {
                        if (val == "") {
                          return "Can't be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    CustomTextFormFieldTwo(
                      hinttext: "password",
                      mycontroller: password,
                    ),

                    InkWell(
                      onTap: () {
                        if (email.text.isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: "Please enter your email first.",
                            btnOkOnPress: () {},
                          ).show();
                          return;
                        }

                        context.read<SignInBloc>().add(
                              PasswordResetRequested(email: email.text),
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.53),
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context: context,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.013),

                    CustomButton(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.063,
                      text: "Log in",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(
                                SignInRequested(
                                  email: email.text,
                                  password: password.text,
                                ),
                              );
                        }
                      },
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              fontSize: getResponsiveFontSize(
                                context: context,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " Register",
                            style: TextStyle(
                              fontSize: getResponsiveFontSize(
                                context: context,
                                fontSize: 17,
                              ),
                              color: const Color(0xff1877F2),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(
                                  RouteNames.signUpScreen,
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
      ),
    );
  }
}
