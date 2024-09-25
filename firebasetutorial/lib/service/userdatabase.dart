import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("UserList")
        .doc(id)
        .set(userInfoMap);

  }

  Future<Stream<QuerySnapshot>> getUsersDetails() async {
    return await FirebaseFirestore.instance.collection("UserList").snapshots();
  }

  Future updateUserDetail(String id, Map<String, dynamic>updateInfo) async {
    return await FirebaseFirestore.instance.collection("UserList")
        .doc(id)
        .update(updateInfo);
  }

  /*Future<void> updateUserDetail(String userId, Map<String, dynamic> data) async {
    DocumentReference documentReference = _firestore.collection('UserList').doc(userId);

    // Check if the document exists
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      // Update the document if it exists
      await documentReference.update(data);
    } else {
      // Create the document if it does not exist
      await documentReference.set(data);
    }
  }*/



  Future deleteUserDetail(String id) async {
    return await FirebaseFirestore.instance.collection("UserList")
        .doc(id).delete();
  }
}