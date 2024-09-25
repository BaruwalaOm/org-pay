import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/pages/homepage.dart';
import 'package:firebasetutorial/pages/login.dart';
import 'package:firebasetutorial/pages/user_profile.dart';
import 'package:firebasetutorial/pages/signup.dart';
import 'package:firebasetutorial/service/notification_service.dart';
import 'package:flutter/material.dart';

class wrapper extends StatefulWidget {
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),

        builder: (context,snapshot){
          if(snapshot.hasData){
            //LocalNotificationService().uploadFormToken();
            return Homepage();
          }else{
            return Login();
          }

        }),
    );
  }
}
