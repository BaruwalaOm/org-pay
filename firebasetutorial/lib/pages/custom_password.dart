import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  const PasswordText({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  var obscureText= true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
        obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Password',
          prefixIcon: const Icon(
            Icons.lock,
          ),
      suffixIcon: GestureDetector(
         onTap: (){
           setState(() {
             obscureText = !obscureText;
           });
         },
          child: obscureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
          )
              : const Icon(
                  Icons.visibility,
                  color: Colors.blue,
          ))),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}

