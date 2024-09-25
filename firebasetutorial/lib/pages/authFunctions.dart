
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetutorial/pages/homepage.dart';
import 'package:firebasetutorial/service/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'firebaseFunctions.dart';

class AuthServices {
  static Future<void> signup(String email, String password, String name, String accountType, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Update display name and email
        await user.updateDisplayName(name);
        await user.updateEmail(email);

        // Set user information in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'accountType': accountType,

        }, SetOptions(merge: true));

        Prefs.accountType.set(accountType);
        // Navigate to the homepage if registration is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );


        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')),
        );
      } else {
        throw Exception("User is null after registration.");
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.message ?? 'An error occurred.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

/*static signin(String email, String password, String name, BuildContext context) async {
try {
await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);

ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text('You are logged in')));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found'){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('No user found with this email')));
} else if (e.code == 'wrong password') {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  } */
}