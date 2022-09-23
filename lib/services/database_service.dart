import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection("groups");

  // saving  the user data
  Future savingUserData(String fullname, String email) async {
    return await userCollection.doc(uid).set({
      "Fullname": fullname,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  // getting the user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // getting user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }
}
