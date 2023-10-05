import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cm_flutter_bootstrap/components/chat_bubble.dart';
import 'package:cm_flutter_bootstrap/components/my_text_field.dart';
import 'package:cm_flutter_bootstrap/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUserID;
  const ChatPage({
    super.key,
    required this.recieverUserEmail,
    required this.recieverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if(_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recieverUserEmail)),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(),),
          
          _buildMessageInput(),
        ],
      ),
      
    );
  }
Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.recieverUserID,
            _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        }
    );
}

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderID'] == _firebaseAuth.currentUser!.uid)
    ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
        (data['senderID'] == _firebaseAuth.currentUser!.uid)
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
        mainAxisAlignment: (data['senderID'] == _firebaseAuth.currentUser!.uid)
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
        children: [
          Text(data['senderEmail']),
          ChatBubble(message: data['message']),
        ],
      )
    ),
    );
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: 'Enter Message',
              obscureText: false,
            ),
        ),

        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,
            ),
        ),
      ],
    );
  }
}
