import 'package:facebook_task/pages/login_page.dart';
import 'package:facebook_task/widgets/custom_text_feild.dart';
import 'package:facebook_task/widgets/custum_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static String id = 'SignupPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff284461),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset('assets/images/scholar.png'),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 33, color: Colors.white),
            ),
            const Spacer(flex: 1),
            const Row(
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const CustomTextFeild(text: 'Email'),
            const SizedBox(height: 10),
            const CustomTextFeild(text: 'Password'),
            const SizedBox(height: 10),
            const CustomButton(text: 'Sign up'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account! ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, LoginPage.id);
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
