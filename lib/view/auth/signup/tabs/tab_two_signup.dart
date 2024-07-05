import 'dart:developer';

import 'package:dogswag_chat_app/core/colors.dart';
import 'package:dogswag_chat_app/view/auth/login/tabs/tab_one.dart';
import 'package:dogswag_chat_app/view/auth/signup/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TabTwoSignUp extends StatelessWidget {
  TabTwoSignUp({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: kBrownColor,
              ),
            ),
          ),
          Text(
            'Welcome to DogSwag!',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: kBrownColor),
            ),
          ),
          Text(
            '(Doctor)',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: kBrownColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          EmailTextFormField(controller: emailController),
          const SizedBox(
            height: 20,
          ),
          PasswordField(passwoedController: passwordController),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (emailController.text.isNotEmpty) {
                log('print Email = ${emailController.text}');
                log('print Password = ${passwordController.text}');

                signUpDoctor(context,
                    emailController: emailController,
                    passwordController: passwordController);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const ScreenHome();
                //     },
                //   ),
                // );
                log('okokokokokokokokokokokokokokokokokokokokok');
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kYellow,
              ),
              child: Center(
                child: Text(
                  'Sign up',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kBrownColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don’t have an Account?  ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
