import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogswag_chat_app/model/user_profile/user_profile_model.dart';
import 'package:flutter/material.dart';

import '../model/dr_profile/dr_profile_model.dart';
import '../model/message/message_model.dart';

class DoctorListPrvider extends ChangeNotifier {
  List<ModelDoctor> doctors = [];
  List<ModelUser> users = [];
  ModelUser? user;
  List<Message> messages = [];

  // set doctor(ModelDoctor doctor) {}

  List<ModelDoctor> getAllDoctors() {
    FirebaseFirestore.instance
        .collection('Doctor')
        .snapshots(includeMetadataChanges: true)
        .listen((doctors) {
      this.doctors =
          doctors.docs.map((doc) => ModelDoctor.fromJson(doc.data())).toList();
      notifyListeners();
    });

    return doctors;
  }

  List<ModelUser> getAllUsers() {
    FirebaseFirestore.instance
        .collection('User')
        .snapshots(includeMetadataChanges: true)
        .listen((doctors) {
      users =
          doctors.docs.map((doc) => ModelUser.fromJson(doc.data())).toList();
      notifyListeners();
    });

    return users;
  }
  // ModelUser? user;

  ModelUser? getUserByID(String userId) {
    FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .snapshots(includeMetadataChanges: true)
        .listen((user) {
      this.user = ModelUser.fromJson(user.data()!);
      notifyListeners();
    });
    return user;
  }

  // List<Message> getMessage(String receiverID) {
  //   FirebaseFirestore.instance
  //       .collection("User")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("Chat")
  //       .doc(receiverID).snapshots(includeMetadataChanges: true).
  //       listen((messages){
  //         this.messages = messages.docs.ma
  //       })
  // }

  List<Message> getMessages(String receiverId, String senderId) {
    FirebaseFirestore.instance
        // .collection('User')
        // .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Chat')
        .doc('$receiverId || $senderId')
        .collection('Messages')
        .orderBy('sentTime', descending: false)
        .snapshots(includeMetadataChanges: true)
        .listen((messages) {
      this.messages =
          messages.docs.map((doc) => Message.fromJson(doc.data())).toList();
      notifyListeners();
    });
    return messages;
  }
}
