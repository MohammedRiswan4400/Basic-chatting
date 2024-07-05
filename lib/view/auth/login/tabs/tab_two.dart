import 'dart:developer';

import 'package:dogswag_chat_app/core/colors.dart';
import 'package:dogswag_chat_app/view/auth/login/tabs/tab_one.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../signup/screen_signup.dart';

// ignore: must_be_immutable
class TabTwo extends StatelessWidget {
  TabTwo({super.key});
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
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
                if (_formKey.currentState?.validate() ?? false) {
                  log('print Email = ${emailController.text}');
                  log('print Password = ${passwordController.text}');
                  signInDoctor(context,
                      emailController: emailController,
                      passwordController: passwordController);
                  log('okokokokokokokokokokokokokokokokokokokokok');
                } else {
                  if (kDebugMode) {
                    print('object');
                  }
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
                    'Sign in',
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
                    Get.to(
                      () => const ScreenSignUp(),
                      transition: Transition.fadeIn,
                      duration: const Duration(
                        seconds: 1,
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
