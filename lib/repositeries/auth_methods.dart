import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/movie.dart';
import 'providers.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signing Up User

  Future<String> saveFav({required List<Movie> fav}) async {
    User? user = _auth.currentUser;

    List<String> favs = fav.map((movie) => movie.title).toList(growable: false);

    if (user != null) {
      await _firestore.collection("users").doc(user.uid).update({"fav": favs});
      return "success";
    } else {
      return " error";
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // adding user in our database
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'pseudo': username,
          'uid': cred.user!.uid,
          'email': email,
          'fav': []
        });

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<List<String>> getFavs() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        var userSnap = await _firestore.collection('users').doc(user.uid).get();
        var favList = userSnap.data()!['fav'];

        return favList;
      }
      return ["null"];
    } catch (e) {
      print(e.toString());
      return ["null"];
    }
  }
}
