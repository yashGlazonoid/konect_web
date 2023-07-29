import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class NotificationData {
  List<Map<String, dynamic>> notifications = [];
  final CollectionReference notificationCollectionRef =
  FirebaseFirestore.instance.collection("notifications");

  Future<List<Map<String, dynamic>>> getData() async {
    try {
      await notificationCollectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          notifications.add(result.data() as Map<String, dynamic>);
        }
      });
      return notifications; // Return the list after populating it with data
    } catch (e) {
      debugPrint("Error: $e");
      return []; // Return an empty list in case of an error
    }
  }
}
