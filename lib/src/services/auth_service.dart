import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final auth = FirebaseAuth.instance;

  //Sign Up Method With Email and Password
  signUp({required String email, required String password, context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The Password is Weak')
            )
        );
      } else if (e.code == 'email-already-in-use') {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already in use')
            )
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //Sign In Method with Email and Password
  signIn({required String email, required String password, context}) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User Not Found for that email')
            )
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that email')
          )
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //Sign Out Method
  signOut() async {
    await auth.signOut();
  }
}
