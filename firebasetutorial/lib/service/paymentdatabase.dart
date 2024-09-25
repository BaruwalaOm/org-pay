import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, QuerySnapshot;

class PaymentDatabaseMethods {

  Future addPaymentDetails(Map<String, dynamic> paymentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("PaymentList")
        .doc(id)
        .set(paymentInfoMap);
  }

  Future<Stream<QuerySnapshot>> getPaymentDetails() async {
    return await FirebaseFirestore.instance.collection("PaymentList").snapshots();
  }

  Future updatePaymentDetails(String id, Map<String, dynamic>updateInfo) async {
    return await FirebaseFirestore.instance.collection("PaymentList")
        .doc(id)
        .update(updateInfo);
  }

  Future deletePaymentDetails(String id) async {
    return await FirebaseFirestore.instance.collection("PaymentList")
        .doc(id).delete();
  }
}