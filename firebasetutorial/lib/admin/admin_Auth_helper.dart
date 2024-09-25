

import 'package:firebasetutorial/admin/adminPanel.dart';
import 'package:firebasetutorial/admin/admin_login.dart';
import 'package:firebasetutorial/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {

  final auth = FirebaseAuth.instance;
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  //void loginUser(context) async {}
  /*void loginUser(context) async {
    try {
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });

      await auth.signInWithEmailAndPassword(email: email.text, password: password.text)
          .then((value) => {
            print("User is Logged In"),
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context)=> Homepage())
            , (route) => false)
      });
    } catch(e) {
      Navigator.pop(context);
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Message"),
              content: Text(e.toString()),
            );
          });
    }
  } */
  void adminLogin(context) async {

      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await FirebaseFirestore.instance.collection("admin").doc("adminLogin").snapshots().forEach((element) {
        if(element.data()?['adminEmail'] == adminEmail.text && element.data()?['adminPassword'] == adminPassword.text) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=> AdminPanel()),
                  (route) => false);
        }
      }).catchError((e){

        showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error Message"),
                content: Text(e.toString()),
              );
            });

      });

  }


 }