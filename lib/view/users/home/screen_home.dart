import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogswag_chat_app/core/const.dart';
import 'package:dogswag_chat_app/model/dr_profile/dr_profile_model.dart';
import 'package:dogswag_chat_app/model/user_profile/user_profile_model.dart';
import 'package:dogswag_chat_app/view/users/chat/screen_chat.dart';
import 'package:dogswag_chat_app/view/users/home/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/dr_provider.dart';
import '../../../model/message/message_model.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    Provider.of<DoctorListPrvider>(context, listen: false).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<DoctorListPrvider>(context, listen: false).getAllDoctors();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const MainContainer(),
              const SizedBox(
                height: 20,
              ),
              const SecondoryTitle(
                title: 'Doctors',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: StreamBuilder(
                      stream: readDoctors(),
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
                                final doctor = doctorsList[index];
                                return GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => ScreenChat(
                                      doctorModel: doctor,
                                    ),
                                  )),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: CostomeListTile(
                                      name: doctor.name,
                                    ),
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
              ),
              // GestureDetector(
              //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => const ScreenChat(),
              //         )),
              //     child: const CostomeListTile(
              //       name: '',
              //     )),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              // const CostomeListTile(),
              const SizedBox(
                height: 20,
              ),
              const SecondoryTitle(
                title: 'Subscription Plans',
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SubscriptionPlanContainerWidgetDog(),
                    SubscriptionPlanContainerWidgetCat(),
                    SubscriptionPlanContainerWidgetDog(),
                    SubscriptionPlanContainerWidgetCat(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Image.asset('asset/painting_dog.png')
              Center(
                child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      storage.write(isUser, false);
                    },
                    child: const Icon(
                      Icons.logout,
                      size: 30,
                    )),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Stream<List<ModelDoctor>> readDoctors() => FirebaseFirestore.instance
    .collection("Doctor")
    .orderBy('lasetActive', descending: true)
    .snapshots()
    .map(
      (snapshot) =>
          snapshot.docs.map((doc) => ModelDoctor.fromJson(doc.data())).toList(),
    );

Stream<List<ModelUser>> readUsers() => FirebaseFirestore.instance
    .collection("User")
    // .orderBy('lasetActive', descending: true)
    .snapshots()
    .map(
      (snapshot) =>
          snapshot.docs.map((doc) => ModelUser.fromJson(doc.data())).toList(),
    );

Stream<List<Message>> readMessages(String receiverId) =>
    FirebaseFirestore.instance
        .collection('Chat')
        .doc('$receiverId || ${storage.read(userID)}')
        .collection('Messages')
        .orderBy('sentTime', descending: false)
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList(),
        );

Stream<List<Message>> getAllmessagess({required String receiverId}) {
  log('$receiverId || ${storage.read(userID)}');
  return FirebaseFirestore.instance
      .collection('Chat')
      .doc('$receiverId || ${storage.read(userID)}')
      .collection('Messages')
      // .doc(email)
      // .collection('Chats')
      .orderBy('SendTime', descending: false)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((docs) => Message.fromJson(docs.data())).toList());
}

Stream<List<Message>> getAllmessagessDR({required String receiverId}) {
  log('${storage.read(drId)} || $receiverId');
  return FirebaseFirestore.instance
      .collection('Chat')
      .doc('${storage.read(drId)} || $receiverId')
      .collection('Messages')
      // .doc(email)
      // .collection('Chats')
      .orderBy('SendTime', descending: false)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((docs) => Message.fromJson(docs.data())).toList());
}
