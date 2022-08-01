import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final auth = FirebaseAuth.instance;

  //Sign Up Method With Email and Password
  signUp({required String email, required String password, context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('weak password');
      } else if (e.code == 'email-already-in-use') {
        print('Email already in use for that account');
      }
    } catch (e) {
      print(e);
    }
  }

  //Sign In Method with Email and Password
  signIn({required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //Sign Out Method
  signOut()async {
    await FirebaseAuth.instance.signOut();
  }
}
