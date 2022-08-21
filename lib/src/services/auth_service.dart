import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Auth {
  final auth = FirebaseAuth.instance;

  //Sign Up Method With Email and Password
  signUp({required String email, required String password, required String name}) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) => {
        FirebaseFirestore.instance.collection('users').add({'name':name})
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The Password is weak'
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'Email already in use'
        );
      }
    } catch (e) {
      Get.snackbar(
          'Error',
          e.toString()
        );
    }
  }

  //Sign In Method with Email and Password
  signIn({required String email, required String password}) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'User Not found for that email'
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong Credential provided'
        );
      }
    } catch (e) {
      Get.snackbar(
          'Error',
          e.toString()
        );
    }
  }

  //Sign Out Method
  signOut() async {
    await auth.signOut();
  }
}
