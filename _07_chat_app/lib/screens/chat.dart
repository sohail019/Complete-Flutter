import 'package:_07_chat_app/widgets/chat_messages.dart';
import 'package:_07_chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');
    // try {
    //   final fcm = FirebaseMessaging.instance;

    //   await fcm.requestPermission();

    //   fcm.subscribeToTopic('chat');
    //   final token = await fcm.getToken();

    //   if (token != null) {
    //     print('FCM Token: $token');
    //   } else {
    //     print('Failed to get FCM token');
    //   }
    // } catch (e) {
    //   print('Error getting FCM token: $e');
    // }
  }

  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: const [Expanded(child: ChatMessages()), NewMessage()],
      ),
    );
  }
}
