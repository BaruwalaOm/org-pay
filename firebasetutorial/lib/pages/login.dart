import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/admin/admin_login.dart';
import 'package:firebasetutorial/pages/forgot.dart';
import 'package:firebasetutorial/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/shared_pref_helper.dart';
import 'custom_password.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading=false;

  final user=FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>?> getUserInformation() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch the user's document from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    } else {
      throw Exception("No user is currently signed in.");
    }
  }
 signIn() async {
    setState(() {
      isloading=true;
    });
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text,);
      //await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text,);

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

          if (userData != null && userData.containsKey('accountType')) {
            print("Account Type: ${userData['accountType']}");
            Prefs.accountType.set(userData['accountType']);
          } else {
            print("No account type found for the user.");
          }
        } else {
          print("User document does not exist.");
        }
      } else {
        print("No user is currently signed in.");
      }
       if(userCredential != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
      }
    }on FirebaseAuthException catch(e) {
      String message = "";
      {
        message = "Invalid E-mail";
      }
      Get.snackbar('Error-msg', message);
    } catch(e){
      Get.snackbar('Error-msg', toString());
    }

    setState(() {
      isloading=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return isloading?Center(child: CircularProgressIndicator(),): Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add the image widget here:
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 100, // Set desired image height
                  width: 500,  // Set desired image width
                ),
              ),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(hintText: 'E-mail',  prefixIcon: Icon(Icons.email_outlined),),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  PasswordText(
                    controller: password,
                    //decoration: const InputDecoration(hintText: 'Password',  prefixIcon: Icon(Icons.lock_outline),),
                    //style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 30, ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap: (() => Get.to(forgot())), child: Text("Forgot Password ?",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue) )),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap: (() => Get.to(Admin_Login())), child: Text("Admin Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue) )),
                    ],
                  ),
                  SizedBox(height: 30, ),
                  ElevatedButton(onPressed: (() => signIn()), child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),
                  SizedBox(height: 30, ),
                  ElevatedButton(onPressed: (() => Get.to(signup())), child: Text("Register Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),


                ],
              ),
            ),
          ),
        );
  }
}