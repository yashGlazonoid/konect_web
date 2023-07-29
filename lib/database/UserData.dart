import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{

  final CollectionReference userRef = FirebaseFirestore.instance.collection("Users");

}