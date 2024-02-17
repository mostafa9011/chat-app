import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == '') return 'field required !';
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class CustomPasswordTextFeild extends StatefulWidget {
  CustomPasswordTextFeild({
    super.key,
    required this.text,
    required this.onChanged,
  });
  final String text;
  final Function(String) onChanged;

  @override
  State<CustomPasswordTextFeild> createState() =>
      _CustomPasswordTextFeildState();
}

class _CustomPasswordTextFeildState extends State<CustomPasswordTextFeild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value == '') return 'field required !';
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: widget.text,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = false;
                  });
                },
                icon: const Icon(Icons.visibility_off,color: Colors.white,),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = true;
                  });
                },
                icon: const Icon(Icons.visibility,color: Colors.white,),
              ),
      ),
    );
  }
}
