import 'package:dogswag_chat_app/core/const.dart';
import 'package:dogswag_chat_app/view/auth/signup/profile/screen_dr_profile.dart';
import 'package:dogswag_chat_app/view/auth/signup/tabs/tab_two_signup.dart';
import 'package:dogswag_chat_app/view/screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import 'profile/screen_user_profile.dart';
import 'tabs/tab_one_signup.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 9),
                  Image.asset(
                    'asset/dogswwag.png',
                    // height: 30,
                    scale: 2.5,
                  ),
                  Text(
                    'DogSwag',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: kBrownColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TabBar(
                      dividerColor: Colors.white,
                      physics: const BouncingScrollPhysics(),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: const Color.fromARGB(255, 249, 231, 77),
                      ),
                      indicatorPadding: const EdgeInsets.all(
                        2,
                      ),
                      labelColor: kBrownColor,
                      unselectedLabelColor:
                          const Color.fromARGB(255, 50, 41, 22),
                      tabs: const <Widget>[
                        Tab(
                          child: Center(
                            child: Text(
                              'User',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              'Doctor',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 450,
                    child: TabBarView(
                      children: [
                        const TabOneSignUp(),
                        TabTwoSignUp(),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'asset/dogswag_title.png',
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future signUpUser(BuildContext context,
    {required TextEditingController emailController,
    required TextEditingController passwordController}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {} on FirebaseAuthException catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return ScreenUserProfile(
        email: emailController.text.trim(),
      );
      // ScreenFirstLoginPage();
    },
  ));
}

Future signUpDoctor(BuildContext context,
    {required TextEditingController emailController,
    required TextEditingController passwordController}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {} on FirebaseAuthException catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return ScreenDrProfile(
        email: emailController.text.trim(),
      );
      // ScreenFirstLoginPageDoctor();
    },
  ));
}

Future signInUser(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    storage.write(userID, emailController.text.trim());
    storage.write(isUser, true);
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print(e);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        // width: 10,
      ),
    );
    // log(e);
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenFirstLoginPage();
    },
  ));
  // navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

Future signInDoctor(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    storage.write(drId, emailController.text.trim());
    // storage.write(isUser, true);
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print(e);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        // width: 10,
      ),
    );
    // log(e);
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenFirstLoginPageDoctor();
    },
  ));
  // navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
// Future<void> signIn(
//     {required TextEditingController emailController,
//     required TextEditingController passwordController}) async {
//   try {
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//     print('User signed in: ${userCredential.user}');
//   } on FirebaseAuthException catch (e) {
//     print('FirebaseAuthException: ${e.message}');
//   } catch (e) {
//     print('Error: ${e.toString()}');
//   }
// }
