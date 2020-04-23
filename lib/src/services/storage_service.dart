import 'dart:io';
import 'package:homathon_project/src/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  StorageReference _storageReference;

  Future uploadProfilePhotoToStorage({
    @required User currentUser,
    @required File profilePhoto,
  }) async {
    try {
      _storageReference = FirebaseStorage.instance.ref().child(
            'profile_photos/${currentUser.uid}/${DateTime.now().millisecondsSinceEpoch}',
          );

      StorageUploadTask _storageUploadTask = _storageReference.putFile(
        profilePhoto,
      );

      var url =
          await (await _storageUploadTask.onComplete).ref.getDownloadURL();
      return url;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future uploadProfilePhoto({
    @required User currentUser,
    @required File profilePhoto,
  }) async {
    String url = await uploadProfilePhotoToStorage(
      currentUser: currentUser,
      profilePhoto: profilePhoto,
    );

    return url;
  }
}
