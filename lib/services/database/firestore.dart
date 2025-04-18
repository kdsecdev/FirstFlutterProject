import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get collection of orders
  final CollectionReference orders =
  FirebaseFirestore.instance.collection('orders');

//save orders to db
  Future<void> saveOrder(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      // add more fields as necessary...
    });
  }
}