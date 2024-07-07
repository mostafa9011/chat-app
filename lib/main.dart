import 'package:facebook_task/core/utils/fcm_service.dart';
import 'package:facebook_task/firebase_options.dart';
import 'package:facebook_task/pages/caht_page.dart';
import 'package:facebook_task/pages/login_page.dart';
import 'package:facebook_task/pages/signup_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmService().init();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        SignupPage.id: (context) => const SignupPage(),
        ChatPage.id: (context) => ChatPage.ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
