import 'dart:async';
import 'package:homathon_project/src/constants/strings.dart';
import 'package:homathon_project/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection(USERS_COLLECTION_NAME);

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.uid).setData(
            user.toJson(),
          );
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(FirebaseUser user) async {
    try {
      var userData = await _usersCollectionReference.document(user.uid).get();
      return User.fromJson(userData.data);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
