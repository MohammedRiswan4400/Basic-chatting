import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogswag_chat_app/core/colors.dart';
import 'package:dogswag_chat_app/core/const.dart';
import 'package:dogswag_chat_app/model/dr_profile/dr_profile_model.dart';
import 'package:dogswag_chat_app/model/message/message_model.dart';
import 'package:dogswag_chat_app/view/users/home/screen_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../controller/dr_provider.dart';
import '../../auth/signup/profile/screen_user_profile.dart';

class ScreenChat extends StatefulWidget {
  const ScreenChat({
    super.key,
    required this.doctorModel,
  });
  // final String userId
  final ModelDoctor doctorModel;

  @override
  State<ScreenChat> createState() => _ScreenChatState();
}

class _ScreenChatState extends State<ScreenChat> {
  TextEditingController chatController = TextEditingController();

  @override
  void initState() {
    Provider.of<DoctorListPrvider>(context, listen: false)
      ..getUserByID(widget.doctorModel.uid)
      ..getMessages(widget.doctorModel.uid, storage.read(userID));

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
                                child: Image.asset('asset/dr.jpg')),
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
                              'Dr. ${widget.doctorModel.name}',
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
                    stream: getAllmessagess(receiverId: widget.doctorModel.uid),
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
                                isME: message.senter == 'User' ? true : false,
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
                        sentText(
                          context,
                          chatController,
                          widget.doctorModel.uid,
                        );
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 9,
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

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMe,
    required this.message,
  });
  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          width: 300,
          decoration: BoxDecoration(
            color: isMe ? kWhite : kBrownColor,
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(20),
              bottomLeft: const Radius.circular(20),
              topLeft:
                  isMe ? const Radius.circular(20) : const Radius.circular(5),
              topRight:
                  isMe ? const Radius.circular(5) : const Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  message.content,
                  style: TextStyle(color: isMe ? Colors.black : kWhite),
                ),
              ),
              Text(
                message.sentTime.toString(),
                style: TextStyle(color: isMe ? Colors.black : kWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MessageBubbleMain extends StatelessWidget {
  const MessageBubbleMain({
    super.key,
    required this.message,
    required this.isME,
  });
  final bool isME;
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isME ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: isME
              ? const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.green)
              : const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 82, 174, 123)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message.content,
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      // color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Text(
                  timeago.format(message.sentTime),
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      // color: Color.fromARGB(255, 0, 0, 0),
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

Future sentText(BuildContext context, TextEditingController controller,
    String receiverId) async {
  if (controller.text.isNotEmpty) {
    await addTextMessage(
        content: controller.text.trim(), receiverId: receiverId);
    controller.clear();
    // ignore: use_build_context_synchronously
    FocusScope.of(context).unfocus();
  }
  // ignore: use_build_context_synchronously
  FocusScope.of(context).unfocus();
}

Future<void> addTextMessage({
  required String content,
  required String receiverId,
}) async {
  final message = Message(
    senter: 'User',
    content: content,
    sentTime: DateTime.now(),
    receiverId: receiverId,
    // messageType: MessageType.text,
    senderId: FirebaseAuth.instance.currentUser!.email.toString(),
  );
  await addMessageToChat(content, message);
}

Future<void> addMessageToChat(
  String receiverId,
  Message message,
) async {
  await FirebaseFirestore.instance
      .collection('Chat')
      .doc('${message.receiverId} || ${message.senderId}')
      .collection('Messages')
      .add(message.toJson());

  log('...........................');
}
