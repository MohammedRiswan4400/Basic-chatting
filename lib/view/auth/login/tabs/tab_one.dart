import 'dart:developer';

import 'package:dogswag_chat_app/core/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/colors.dart';
import '../../signup/screen_signup.dart';

bool isObscure = true;

// ignore: must_be_immutable
class TabOne extends StatelessWidget {
  TabOne({super.key});
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
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
                  color: kBrownColor,
                ),
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
                if (formKey.currentState?.validate() ?? false) {
                  storage.write(isUser, true);
                  log('okokokokokokokokokokokokokokokokokokokokok');
                  signInUser(context,
                      emailController: emailController,
                      passwordController: passwordController);

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
                    // if (formKey.currentState?.validate() ?? false) {
                    Get.to(
                      () => const ScreenSignUp(),
                      transition: Transition.fadeIn,
                      duration: const Duration(
                        seconds: 1,
                      ),
                    );
                    // } else {
                    //   if (kDebugMode) {
                    //     print('object');
                    //   }
                    // }
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const ScreenSignUp(),
                    // ));
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

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwoedController,
  });
  final TextEditingController passwoedController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwoedController,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kBrownColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kBrownColor, width: 1.0),
        ),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: isObscure
                ? const Icon(
                    Icons.visibility_off_outlined,
                    color: kBrownColor,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    color: kBrownColor,
                  )),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required*';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      obscureText: isObscure ? true : false,
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          // borderSide: const BorderSide(color: kGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
            width: 1.0,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required*';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
