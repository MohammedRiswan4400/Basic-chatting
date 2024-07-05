import 'package:dogswag_chat_app/core/const.dart';
import 'package:dogswag_chat_app/view/auth/login/screen_login.dart';
import 'package:dogswag_chat_app/view/doctors/home/screen_dr_home.dart';
import 'package:dogswag_chat_app/view/users/home/screen_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    if (storage.read(isUser) ?? false) {
      // log(storage.read(isLoggedin));
      /////////////
      Get.offAll(() => const ScreenFirstLoginPage());
      ////////////
    } else {
      Get.off(const ScreenFirstLoginPageDoctor());
    }

    super.onInit();
  }
}

class ScreenFirstLoginPage extends StatefulWidget {
  const ScreenFirstLoginPage({super.key});

  @override
  State<ScreenFirstLoginPage> createState() => _ScreenFirstLoginPageState();
}

class _ScreenFirstLoginPageState extends State<ScreenFirstLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Somthing Went Wrong"),
            );
          } else if (snapshot.hasData) {
            return
                // ScreenNavigation();
                const ScreenHome();
          } else {
            return const ScreenLogin();
          }
        },
      ),
    );
  }
}

class ScreenFirstLoginPageDoctor extends StatefulWidget {
  const ScreenFirstLoginPageDoctor({super.key});

  @override
  State<ScreenFirstLoginPageDoctor> createState() =>
      _ScreenFirstLoginPageDoctor();
}

class _ScreenFirstLoginPageDoctor extends State<ScreenFirstLoginPageDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Somthing Went Wrong"),
            );
          } else if (snapshot.hasData) {
            return const ScreenDrHome();
          } else {
            return const ScreenLogin();
          }
        },
      ),
    );
  }
}
