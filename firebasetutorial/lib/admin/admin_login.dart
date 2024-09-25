import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetutorial/admin/admin_Auth_helper.dart';
//import 'package:firebasetutorial/pages/login.dart';
import 'package:firebasetutorial/pages/signup.dart';
import 'package:flutter/material.dart';
import '../pages/authFunctions.dart';
import '../pages/homepage.dart';
import '../pages/login.dart';
import 'custom_admin_password.dart';


final auth = FirebaseAuth.instance;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: auth.currentUser == null ? Admin_Login() : Homepage(),
    ),
  );
}

 /*class Login extends StatelessWidget {
  AuthService authServices = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AdminLogin"),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: authServices.email,
                decoration: const InputDecoration(hintText: 'E-mail',  prefixIcon: Icon(Icons.email_outlined),),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: authServices.password,
                decoration: const InputDecoration(hintText: 'Password',  prefixIcon: Icon(Icons.lock_outline),),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              //SizedBox(height: 30, ),
              //InkWell(onTap: (() => Get.to(forgot())), child: Text("Forgot Password ?",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),
              SizedBox(height: 30, ),
              ElevatedButton (
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 70)),

                  onPressed: () {
                    if(authServices.adminEmail != "" && authServices.adminPassword != "") {
                      authServices.loginUser(context);
                    }
                  },
                  child: Text("Login")),

              TextButton(
                  onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Login()));
              },

                  child: Text("Not Admin")),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> Admin_Login()));
                    },

                    child: Text("GoTo Admin Account")),
              )
              //SizedBox(height: 30, ),
              //ElevatedButton(onPressed: (() => Get.to(signup())), child: Text("Register Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),

            ],
          ),
        )
    );
  }
} */
class Admin_Login extends StatelessWidget {
  AuthService authServices = AuthService();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: Text("AdminLogin"),
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
                     'assets/images/ad.png',
                     height: 150, // Set desired image height
                     width: 500,  // Set desired image width
                   ),
                 ),
                 TextField(
                   controller: authServices.adminEmail,
                   decoration: const InputDecoration(hintText: 'E-mail',  prefixIcon: Icon(Icons.email_outlined),),
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                 ),
                 AdminPasswordText(
                     controller: authServices.adminPassword
                   //decoration: const InputDecoration(hintText: 'Password',  prefixIcon: Icon(Icons.lock_outline),),
                   //style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                 ),
                 //SizedBox(height: 30, ),
                 //InkWell(onTap: (() => Get.to(forgot())), child: Text("Forgot Password ?",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),
                 SizedBox(height: 30, ),
                 ElevatedButton (
                   style: TextButton.styleFrom(
                     padding: EdgeInsets.symmetric(horizontal: 70)),

                   onPressed: () {
                     if(authServices.adminEmail != "" && authServices.adminPassword != "") {
                       authServices.adminLogin(context);
                     }
                   },
                   child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),
                 SizedBox(height: 20,),
                 TextButton(onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                 },

                 child: Text("Not Admin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700) ))
                 //SizedBox(height: 30, ),
                 //ElevatedButton(onPressed: (() => Get.to(signup())), child: Text("Register Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) )),

               ],
             ),
           ),
         )
     );
   }
 }



