import 'package:firebase_auth/firebase_auth.dart';
import 'package:vechat/services/database_service.dart';
import 'package:vechat/helper/helper_functions.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// login function
  Future loginUserWithEmailandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call the database service to update the user database

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// register function
  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call the database service to update the user database
        await DatabaseService(uid: user.uid).savingUserData(fullname, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// signout function

  Future signOut() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserNameSF("");
      await HelperFunction.saveUserEmailSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
