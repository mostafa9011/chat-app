import 'dart:developer';

import 'package:facebook_task/constants.dart';
import 'package:facebook_task/pages/login_page.dart';
import 'package:facebook_task/widgets/custom_text_feild.dart';
import 'package:facebook_task/widgets/custum_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String id = 'SignupPage';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String email, password;

  bool isLoaded = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
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
                      'Sign up',
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
                CustomPasswordTextFeild(
                  text: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Sign up',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoaded = true;
                      });
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        setState(() {
                          isLoaded = false;
                        });

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'success Sign Up => ${credential.user!.email}'),
                          ),
                        );
                        log('success Sign Up => ${credential.user!.email}');
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          isLoaded = false;
                        });
                        if (e.code == 'weak-password') {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('The password provided is too weak.'),
                            ),
                          );
                          log('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'The account already exists for that email.')),
                          );
                          log('The account already exists for that email.');
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        setState(() {
                          isLoaded = false;
                        });
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('there was an error')),
                        );
                        log("there was an error");
                      }
                    }
                  },
                ),
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
        ),
      ),
    );
  }
}
