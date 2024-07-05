import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogswag_chat_app/core/colors.dart';
import 'package:dogswag_chat_app/core/const.dart';
import 'package:dogswag_chat_app/model/dr_profile/dr_profile_model.dart';
import 'package:dogswag_chat_app/model/user_profile/user_profile_model.dart';
import 'package:dogswag_chat_app/view/screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScreenUserProfile extends StatelessWidget {
  ScreenUserProfile({super.key, required this.email});
  final String email;
  TextEditingController nameController = TextEditingController();
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset('asset/painting_dog.png'),
                Text(
                  'Profile',
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
                TextFormFieldWidget(
                  hintText: 'Name',
                  errorMessage: 'Name is required*',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: 'Pet Name',
                  errorMessage: 'Pet name is required*',
                  controller: petNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: 'Type (cat, dog, ....)',
                  errorMessage: 'Type is required*',
                  controller: petTypeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final name = nameController.text.trim();
                      final petName = petNameController.text.trim();
                      final petType = petTypeController.text.trim();
                      await addUser(
                          uID: email,
                          name: name,
                          petName: petName,
                          petType: petType);
                      log('message');
                      storage.write(isUser, true);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const ScreenFirstLoginPage();
                        },
                      ));
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
                          'Save',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.errorMessage,
    required this.controller,
  });
  final String hintText;
  final String errorMessage;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhite,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kBrownColor),
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
      validator: (fisrName) {
        if (fisrName == null || fisrName.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
    );
  }
}

class TextFormFieldWidgetTwo extends StatefulWidget {
  const TextFormFieldWidgetTwo({
    super.key,
    required this.hintText,
    // required this.errorMessage,
    required this.controller,
  });
  final String hintText;
  // final String errorMessage;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidgetTwo> createState() => _TextFormFieldWidgetTwoState();
}

class _TextFormFieldWidgetTwoState extends State<TextFormFieldWidgetTwo> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhite,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kBrownColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBrownColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

Future<void> addUser({
  required String uID,
  required String name,
  required String petName,
  required String petType,
}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      final docUser =
          // FirebaseFirestore.instance.collection("Role").doc("Doctor");
          FirebaseFirestore.instance
              .collection('User')
              .doc(FirebaseAuth.instance.currentUser!.email);
      final user = ModelUser(
        uID: uID,
        name: name,
        petName: petName,
        petType: petType,
      );

      final json = user.toJson();
      await docUser.set(json);
      storage.write(userID, uID);
      if (kDebugMode) {
        print('User added successfully');
        log(storage.read(userID));
      }
    } else {
      if (kDebugMode) {
        print('No user signed in');
      }
    }
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) {
      print('FirebaseAuthException: ${e.message}');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: ${e.toString()}');
    }
  }
}

Future<void> addDr({
  required String uID,
  required String name,
  required String experiance,
  required String education,
  required String profasseional,
  required String speciality,
}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      final docUser =
          // FirebaseFirestore.instance.collection("Role").doc("Doctor");
          FirebaseFirestore.instance
              .collection('Doctor')
              .doc(FirebaseAuth.instance.currentUser!.email);
      final user = ModelDoctor(
        uid: uID,
        name: name,
        experiance: experiance,
        education: education,
        professional: profasseional,
        speciality: speciality,
        lasetAcctive: DateTime.now(),
      );

      final json = user.toJson();
      await docUser.set(json);
      storage.write(drId, uID);
      storage.write(drName, name);
      if (kDebugMode) {
        print('User added successfully');
      }
    } else {
      if (kDebugMode) {
        log('No user signed in');
      }
    }
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) {
      log('FirebaseAuthException: ${e.message}');
    }
  } catch (e) {
    if (kDebugMode) {
      log('Error: ${e.toString()}');
    }
  }
}

// Future addUser({
//   required String name,
//   required String petName,
//   required String petType,
// }) async {
//   //   try {
// //     User? user = _auth.currentUser;
// //     if (user != null) {
// //       await _firestore.collection('users').doc(user.email).set({
// //         'name': name,
// //         'email': user.email,
// //       });
// //       print('User added successfully');
// //     } else {
// //       print('No user signed in');
// //     }
// //   } on FirebaseAuthException catch (e) {
// //     print('FirebaseAuthException: ${e.message}');
// //   } catch (e) {
// //     print('Error: ${e.toString()}');
// //   }
//   final docUser =
//       // FirebaseFirestore.instance.collection("Role").doc("Doctor");
//       FirebaseFirestore.instance
//           .collection('User')
//           .doc(FirebaseAuth.instance.currentUser!.email);
//   // .collection("cart")
//   // .doc(productName + storage);
//   final user = ModelUser(
//     name: name,
//     petName: petName,
//     petType: petType,
//   );

//   final json = user.toJson();
//   await docUser.set(json);

//   Get.to(
//     () {
//       const ScreenFirstLoginPage();
//     },
//     transition: Transition.fadeIn,
//     duration: const Duration(
//       seconds: 1,
//     ),
//   );
// }
