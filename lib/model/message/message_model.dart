import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime sentTime;
  final String senter;
  // final MessageType messageType;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.sentTime,
    required this.senter,
    // required this.messageType,
  });

  Map<String, dynamic> toJson() => {
        "SenderId": senderId,
        "recieverID": receiverId,
        "Content": content,
        "SendTime": Timestamp.fromDate(sentTime),
        "Sender": senter
        // "MessageType": messageType,
      };

  static Message fromJson(Map<String, dynamic> json) => Message(
        senter: json["Sender"],
        senderId: json["SenderId"],

        receiverId: json["recieverID"],
        content: json["Content"],
        sentTime: (json["SendTime"] as Timestamp)
            .toDate(), // Convert Timestamp to DateTime
        // messageType: json["MessageType"],
      );
}
