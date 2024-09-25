import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetutorial/pages/homepage.dart';
import 'package:firebasetutorial/pages/login.dart';
import 'package:firebasetutorial/pages/mail_page.dart';
import 'package:firebasetutorial/pages/wrapper.dart';
import 'package:firebasetutorial/pages/login.dart';
import 'package:firebasetutorial/pages/wrapper.dart';
import 'package:firebasetutorial/service/notification_service.dart';
import 'package:firebasetutorial/service/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  //LocalNotificationService().requestPermission();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 @override
  void initState() {
    super.initState();
    notificationHandler();
  }

 void notificationHandler() {
   FirebaseMessaging.onMessage.listen((event) async{
     print(event.notification!.title);
   });
 }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: wrapper(),

    );
  }


}