import 'dart:developer';

import 'package:facebook_task/pages/home_page.dart';
import 'package:facebook_task/pages/signup_pages.dart';
import 'package:facebook_task/widgets/custom_text_feild.dart';
import 'package:facebook_task/widgets/custum_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;

  bool isLoaded = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        backgroundColor: const Color(0xff284461),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 33,
                      color: Colors.white),
                ),
                const Spacer(flex: 1),
                const Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextFeild(
                  text: 'Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFeild(
                  text: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Log in',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoaded = true;
                      });
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        setState(() {
                          isLoaded = false;
                        });
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'success Login => ${credential.user!.email}'),
                          ),
                        );
                        log('success Login => ${credential.user!.email}');
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          isLoaded = false;
                        });
                        if (e.code == 'user-not-found') {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No user found for that email.'),
                            ),
                          );
                          log('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Wrong password provided for that user.'),
                            ),
                          );
                          log('Wrong password provided for that user.');
                        }
                      } catch (ex) {
                        setState(() {
                          isLoaded = false;
                        });
                        log(ex.toString());
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont have an account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
