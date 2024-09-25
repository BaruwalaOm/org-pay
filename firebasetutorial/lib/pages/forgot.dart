import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/pages/wrapper.dart';
import 'package:flutter/material.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {

  TextEditingController email = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forgot Password"),),
    body: Center(
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    // Add the image widget here:
    Padding(
    padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
    child: Image.asset(
    'assets/images/forgot.png',
    height: 250, // Set desired image height
    width: 500,  // Set desired image width
    ),
    ),
              TextField(
                controller: email,
                decoration: const InputDecoration(hintText: 'E-mail', prefixIcon: Icon(Icons.email_outlined),),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30, ),
              ElevatedButton(onPressed: (() => reset()), child: Text("Send link", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ))
            ],
          ),
        )
    ),
    );
  }
}
