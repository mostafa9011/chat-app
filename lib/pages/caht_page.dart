import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_task/constants.dart';
import 'package:facebook_task/models/message_model.dart';
import 'package:facebook_task/widgets/bubble_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage.ChatPage({super.key});
  static const String id = 'homePage';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagesCollection);
  final TextEditingController text = TextEditingController();
  final controller = ScrollController();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(kmessagesCollection)
      .orderBy('time', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kImage,
                height: 50,
              ),
              const Text(
                'Chat',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  } else {
                    // List<Message> messagesList = [];
                    // for (int i = 0; i <= snapshot.data!.docs.length; i++) {
                    //   messagesList.add(
                    //     Message.fromJason(
                    //       snapshot.data!.docs[i],
                    //     ),
                    //   );
                    // }
                    return ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return email == snapshot.data!.docs[index]['id']
                            ? BubbleMessage(
                                message: snapshot.data!.docs[index]['message'],
                              )
                            : FrendBubbleMessage(
                                message: snapshot.data!.docs[index]['message'],
                              );

                        //BubbleMessage();
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: text,
                // onSubmitted: (value) {
                //   messages.add(
                //     {
                //       'message': value,
                //       'time': DateTime.now(),
                //       'id': email,
                //     },
                //   );
                //   text.clear();
                //   controller.animateTo(
                //     0,
                //     //controller.position.maxScrollExtent,
                //     duration: const Duration(seconds: 1),
                //     curve: Curves.easeIn,
                //   );
                // },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  hintText: 'Enter your message ',
                  suffixIcon: IconButton(
                    onPressed: () {
                      text.text == ''
                          ? {}
                          : {
                              messages.add(
                                {
                                  'message': text.text,
                                  'time': DateTime.now(),
                                  'id': email,
                                },
                              ),
                              text.clear(),
                              controller.animateTo(
                                0,
                                //controller.position.maxScrollExtent,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                              ),
                            };
                    },
                    icon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
