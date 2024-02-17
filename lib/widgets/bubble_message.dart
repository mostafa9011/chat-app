import 'package:facebook_task/constants.dart';
import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class FrendBubbleMessage extends StatelessWidget {
  const FrendBubbleMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: const BoxDecoration(
          color: Color(0xff006389),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
