import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:homathon_project/src/models/user.dart';
import 'package:homathon_project/src/providers/base_provider.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/cached_image.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends BaseProvider {
  initStateFunc({
    @required BuildContext contextFromFunc,
  }) {
    context = contextFromFunc;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext context;
  File _newProfilePhoto;
  String newFirstName = '';
  String newLastName = '';
  String newEmail = '';

  displayProfileImage() {
    // No new profile image
    if (_newProfilePhoto == null) {
      if (currentUser.profilePhoto == null) {
        return Image.asset(
          'assets/images/defaults/default_profile_image.png',
        );
      } else {
        // User profile image exists
        return CachedImage(
          url: currentUser.profilePhoto,
        );
      }
    } else {
      // New profile image
      return Image.file(
        _newProfilePhoto,
        width: blockSizeHorizontal(context) * 30,
        height: blockSizeHorizontal(context) * 30,
      );
    }
  }

  pickImage({
    @required ImageSource source,
  }) async {
    File selectedImage = await utils.pickImage(
      source: source,
    );

    File croppedImage = await utils.crop(
      imageFile: selectedImage,
    );

    if (croppedImage != null) {
      setBusy(true);

      _newProfilePhoto = croppedImage;
      notifyListeners();

      setBusy(false);
    } else {
      dialogService.showDialog(
        title: 'Something went wrong!',
        description: 'Please try again later!',
      );
    }
  }

  submit() async {
    setBusy(true);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      setBusy(true);

      // Update user in database
      String _newProfilePhotoUrl = '';

      if (_newProfilePhoto == null) {
        _newProfilePhotoUrl = currentUser.profilePhoto;
        notifyListeners();
      } else {
        _newProfilePhotoUrl = await storageService.uploadProfilePhoto(
          currentUser: currentUser,
          profilePhoto: _newProfilePhoto,
        );
      }

      User currentUserWithNewData = User(
        uid: currentUser.uid,
        email: newEmail,
        firstName: newFirstName,
        lastName: newLastName,
        profilePhoto: _newProfilePhotoUrl,
        username: currentUser.username,
        idNumber: currentUser.idNumber,
      );

      await firestoreService.updateUserData(
        currentUser: currentUser,
        currentUserWithNewData: currentUserWithNewData,
      );
      await authenticationService.rePopulateCurrentUser();
      popCurrentContext();
    } else {
      await dialogService.showDialog(
        title: 'Something went wrong!',
        description: 'Please try again later!',
      );
      setBusy(false);
    }
  }
}
