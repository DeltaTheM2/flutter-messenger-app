import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cm_flutter_bootstrap/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String recieverID, String message) async{
    // get current user info
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    
    //create new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        recieverID: recieverID,
        message: message,
        timestamp: timestamp
    );
    //construct chat room id from current user ID and reciever ID
    List<String> ids = [currentUserID, recieverID];
    ids.sort();
    String chatRoomID = ids.join("_");
    // add new message to database
    await _firestore.collection('chat_rooms').doc(chatRoomID).collection('messages').add(newMessage.toMap());

  }

  // GET MESSAGES
Stream<QuerySnapshot> getMessages(String userID, String otherUserID){
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false).snapshots();


}
}