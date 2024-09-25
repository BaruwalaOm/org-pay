/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalNotificationService {
  Future<void> requestPermission() async {
    // request permission to show notifications
    PermissionStatus status = await Permission.notification.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Permission not granted');
    }
  }

  final firebaseFirestore = FirebaseFirestore.instance;
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<void> uploadFormToken() async {
    try {
      await FirebaseMessaging.instance.getToken().then((token) async {
        print('getToken :: $token');
        await firebaseFirestore.collection('users').doc(_currentUser!.uid).set({
          'notificationToken': token,
        });
      });
    } catch(e) {
      print(e.toString());
    }
    }
  } */
