import 'package:dogswag_chat_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'asset/dogs_photo_two.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vat Chat',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Text(
                    'Chat with Top Vets for FREE Emergency Assistance and Advice',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondoryTitle extends StatelessWidget {
  const SecondoryTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CostomeListTile extends StatelessWidget {
  const CostomeListTile({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        color: const Color.fromARGB(0, 151, 151, 151),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kBrownColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('asset/dr.jpg')),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Dr. $name',
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
    );
  }
}

class MinimumTextWidget extends StatelessWidget {
  const MinimumTextWidget({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '>',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            // color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 260,
          child: Text(
            content,
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                // color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SubscriptionPlanContainerWidgetDog extends StatelessWidget {
  const SubscriptionPlanContainerWidgetDog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Stack(
        children: [
          Container(
            height: 430,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 225, 135),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('asset/dog_photo_one.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'AL\'S CHAT',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'One Time Chat',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Free',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(
                    'Inclusive of',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const MinimumTextWidget(
                      content: '1 Free Consultation Via Text'),
                  const MinimumTextWidget(
                      content: 'Upload Pictures, Videos, and Documents'),
                  const MinimumTextWidget(
                      content: 'Record Management for Your Pet'),
                  const MinimumTextWidget(
                      content: 'Case Summary and Prescription'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Text(
                        'Start Now',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.amber,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Validity - 15 Days',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SubscriptionPlanContainerWidgetCat extends StatelessWidget {
  const SubscriptionPlanContainerWidgetCat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Stack(
        children: [
          Container(
            height: 430,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 225, 135),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('asset/cat.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOBY\'S TOP UP',
                              style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'One Vet Chat',
                              style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹ 299',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(
                    'Inclusive of',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const MinimumTextWidget(
                      content: '1 Free Consultation Via Text'),
                  const MinimumTextWidget(
                      content: 'Upload Pictures, Videos, and Documents'),
                  const MinimumTextWidget(
                      content: 'Record Management for Your Pet'),
                  const MinimumTextWidget(
                      content: 'Case Summary and Prescription'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Text(
                        'Start Now',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.amber,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Validity - 30 Days',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
