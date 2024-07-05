import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogswag_chat_app/model/user_profile/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/dr_provider.dart';
import '../../../core/colors.dart';
import '../../../core/const.dart';
import '../../../model/message/message_model.dart';
import '../../auth/signup/profile/screen_user_profile.dart';
import '../../users/chat/screen_chat.dart';
import '../../users/home/screen_home.dart';

class ScreenDRChat extends StatefulWidget {
  const ScreenDRChat({
    super.key,
    required this.userModel,
  });
  // final String userId
  final ModelUser userModel;

  @override
  State<ScreenDRChat> createState() => _ScreenDRChatState();
}

class _ScreenDRChatState extends State<ScreenDRChat> {
  TextEditingController chatController = TextEditingController();

  @override
  void initState() {
    Provider.of<DoctorListPrvider>(context, listen: false)
      ..getUserByID(widget.userModel.uID)
      ..getMessages(
        widget.userModel.uID,
        storage.read(userID),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              'asset/backround_chat.png',
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                    //     gradient: LinearGradient(colors: [
                    //   // Colors.black,
                    //   // Color.fromARGB(184, 0, 0, 0),
                    //   Color.fromARGB(65, 0, 0, 0)
                    // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    color: Color.fromARGB(195, 0, 0, 0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: kWhite,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kBrownColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset('asset/user.jpg')),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.userModel.name,
                              style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              // widget.doctorModel.
                              //     ?
                              'Online',
                              //     : 'Offline',
                              style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  // color: Colors.amber,
                  height: MediaQuery.of(context).size.height / 1.25,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child:
                      // StreamBuilder<List<Message>>(
                      //   stream: getAllmessagess(receiverId: widget.doctorModel.uid),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasError) {
                      //       log(snapshot.error.toString());
                      //       return Center(
                      //         child: Text('${snapshot.error}'),
                      //       );
                      //     } else if (snapshot.hasData) {
                      //       //  List<MessageBubble> messageBubbleList = [];

                      //       final messagesList = snapshot.data!;
                      //       log(messagesList.toString());
                      //       if (messagesList.isEmpty) {
                      //         return Center(child: Text('No message'));
                      //       }
                      //       return ListView.separated(
                      //         reverse: true,
                      //         separatorBuilder: (context, index) => SizedBox(
                      //           height: 10,
                      //         ),
                      //         itemBuilder: (context, index) {
                      //           final message = messagesList.toList()[index];
                      //           return Container(
                      //             color: Colors.amber,
                      //             child: MessageBubble(
                      //               isMe: storage.read(isUser) ? true : false,
                      //               message: message,
                      //             ),
                      //           );
                      //         },
                      //         itemCount: messagesList.length,
                      //       );
                      //     } else {
                      //       return const Center(child: CircularProgressIndicator());
                      //     }
                      //   },
                      // ),

                      /////////////////
                      StreamBuilder(
                    stream: getAllmessagessDR(receiverId: widget.userModel.uID),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Errror');
                      }
                      if (snapshot.hasData) {
                        final doctorsList = snapshot.data;
                        log(doctorsList.toString());
                        if (doctorsList!.isEmpty) {
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 85, 224, 150)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(child: Text('Say Hello!')),
                                  )),
                            ],
                          );
                        } else {
                          final messageList = doctorsList.reversed;
                          return ListView.builder(
                            reverse: true,
                            itemCount: messageList.length,
                            itemBuilder: (context, index) {
                              final message = doctorsList[index];
                              return MessageBubbleMain(
                                message: messageList.toList()[index],
                                isME: message.senter == 'Doctor' ? true : false,
                              );
                            },
                          );
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 85, 224, 150)),
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Center(child: Text('Say Hello!')),
                              )),
                        ],
                      );
                    },
                  ),
                  ////////////////////
                  //   Consumer<DoctorListPrvider>(
                  // builder: (context, value, child) {
                  //   log(value.messages.toString());
                  //   print('${value.messages.toString()} =============');
                  //   return value.messages.isEmpty
                  //       ? Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 4,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color:
                  //                         Color.fromARGB(255, 85, 224, 150)),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(20.0),
                  //                   child: const Center(
                  //                       child: Text('Say Hello!')),
                  //                 )),
                  //           ],
                  //         )
                  //       : ListView.builder(
                  //           itemCount: value.messages.length,
                  //           itemBuilder: (context, index) {
                  //             print(
                  //                 '${value.messages.toString()} =============');
                  //             return MessageBubbleMain(
                  //               message: value.messages[index],
                  //               isME: storage.read(isUser),
                  //             );
                  //           },
                  // );
                  // },
                  // ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextFormFieldWidgetTwo(
                          hintText: 'Chat', controller: chatController),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        sentTextDr(
                          context,
                          chatController,
                          widget.userModel.uID,
                        );
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 9,
                        // doub
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 143, 44),
                        ),
                        child: const Icon(
                          Icons.send_rounded,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future sentTextDr(BuildContext context, TextEditingController controller,
    String receiverId) async {
  if (controller.text.isNotEmpty) {
    await addTextMessageDr(
        content: controller.text.trim(), receiverId: receiverId);
    controller.clear();
    // ignore: use_build_context_synchronously
    FocusScope.of(context).unfocus();
  }
  // ignore: use_build_context_synchronously
  FocusScope.of(context).unfocus();
}

Future<void> addTextMessageDr({
  required String content,
  required String receiverId,
}) async {
  final message = Message(
    senter: 'Doctor',
    content: content,
    sentTime: DateTime.now(),
    receiverId: receiverId,
    // messageType: MessageType.text,
    senderId: FirebaseAuth.instance.currentUser!.email.toString(),
  );
  await addMessageToChatDr(content, message);
}

Future<void> addMessageToChatDr(
  String receiverId,
  Message message,
) async {
  log('${storage.read(drId)} || ${message.receiverId}?????????');
  await FirebaseFirestore.instance
      .collection('Chat')
      .doc('${storage.read(drId)} || ${message.receiverId}')
      .collection('Messages')
      .add(message.toJson());

  log('...........................');
}
