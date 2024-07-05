import 'dart:developer';

import 'package:dogswag_chat_app/core/colors.dart';
import 'package:dogswag_chat_app/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen_user_profile.dart';

// ignore: must_be_immutable
class ScreenDrProfile extends StatelessWidget {
  ScreenDrProfile({super.key, required this.email});
  final String email;
  TextEditingController nameController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController profassiuonalSummeryController =
      TextEditingController();
  TextEditingController specialityController = TextEditingController();
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
                  'Dr. Profile',
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
                  hintText: 'Experiance',
                  errorMessage: 'Experiance is required*',
                  controller: experianceController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: 'Education',
                  errorMessage: 'Education is required*',
                  controller: educationController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: 'Professional Summary',
                  errorMessage: 'Professional Summary is required*',
                  controller: profassiuonalSummeryController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: 'Speciality',
                  errorMessage: 'Speciality is required*',
                  controller: specialityController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final name = nameController.text.trim();
                      final expariance = experianceController.text.trim();
                      final education = educationController.text.trim();
                      final professionalSummary =
                          profassiuonalSummeryController.text.trim();
                      final speciality = specialityController.text.trim();
                      await addDr(
                        uID: email,
                        name: name,
                        profasseional: professionalSummary,
                        experiance: expariance,
                        education: education,
                        speciality: speciality,
                      );
                      log('message');
                      // storage.write(isUser, true);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const ScreenFirstLoginPageDoctor();
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
