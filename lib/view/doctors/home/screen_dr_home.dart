import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';
import '../../../core/const.dart';
import '../../users/home/screen_home.dart';
import '../chat/screen_chat.dart';

class ScreenDrHome extends StatelessWidget {
  const ScreenDrHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                // height: 60,
                // width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kYellow),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getGreeting()
                    //Dr. ${storage.read(drName)}'
                    ,
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Users'
                //Dr. ${storage.read(drName)}'
                ,
                style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    // color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: StreamBuilder(
                    stream: readUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        const Text('Errror');
                      }
                      if (snapshot.hasData) {
                        final doctorsList = snapshot.data;
                        if (doctorsList!.isEmpty) {
                          const Text('Empty');
                        } else {
                          if (kDebugMode) {
                            print(doctorsList);
                          }
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: doctorsList.length,
                            itemBuilder: (context, index) {
                              final user = doctorsList[index];
                              return GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => ScreenDRChat(
                                    userModel: user,
                                  ),
                                )),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      width: double.infinity,
                                      color: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: kBrownColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.asset(
                                                      'asset/user.jpg')),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            user.name,
                                            style: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                // color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // CostomeListTile(
                                  //   name: doctor.name,
                                  // ),
                                ),
                              );
                              //   },
                              // );
                            },
                          );
                        }
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        storage.write(isUser, false);
                      },
                      child: const Icon(Icons.logout)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return "Good morning";
    } else if (hour < 17) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }
}
