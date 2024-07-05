import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/main_screen.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    gotoMainScreen();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'asset/dogswwag.png',
                scale: 1.5,
              ),
              Image.asset(
                'asset/dogswag_title.png',
                scale: 2.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// gotoMainScreen() async {
//   await Future.delayed(
//     const Duration(
//       seconds: 3,
//     ),
//   ).then(
//     (value) {
//       Get.put(const ScreenLogin());
//     },
//   );
// }

// gotoMainScreen(context) async {
//   await Future.delayed(
//     const Duration(
//       seconds: 3,
//     ),
//   );
//   Navigator.of(context).pushReplacement(MaterialPageRoute(
//     builder: (context) {
//     },
//   ));
// }

gotoMainScreen() async {
  Future.delayed(
    const Duration(
      seconds: 3,
    ),
  ).then(
    (value) {
      Get.put(AuthController());
    },
  );
}
