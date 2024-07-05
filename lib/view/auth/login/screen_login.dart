import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';
import 'tabs/tab_one.dart';
import 'tabs/tab_two.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
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
                              'Users',
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
                    height: 470,
                    child: TabBarView(
                      children: [
                        TabOne(),
                        TabTwo(),
                      ],
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height / ),

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
