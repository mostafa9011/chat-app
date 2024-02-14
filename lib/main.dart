import 'package:facebook_task/pages/login_page.dart';
import 'package:facebook_task/pages/signup_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id:(context) => const LoginPage(),
        SignupPage.id:(context) => const SignupPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
