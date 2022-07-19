import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;

  final String username;

  final List fav;

  const User(
      {required this.username,
      required this.uid,
      required this.email,
      required this.fav});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      fav: snapshot["fav"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "fav": fav,
      };
}
