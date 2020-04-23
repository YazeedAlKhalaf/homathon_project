import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homathon_project/src/models/user.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';

class Utils {
  String getFullName({
    @required User currentUser,
  }) {
    String firstName = currentUser.firstName;
    String lastName = currentUser.lastName;

    String fullName = firstName + ' ' + lastName;

    return fullName;
  }

  Future<File> pickImage({
    ImageSource source,
  }) async {
    File selectedImage = await ImagePicker.pickImage(
      source: source,
      imageQuality: 50,
      maxHeight: 500,
      maxWidth: 500,
    );
    return selectedImage;
  }

  crop({
    File imageFile,
  }) async {
    if (imageFile == null) return null;

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop',
        toolbarColor: textColorBlack,
        toolbarWidgetColor: textColorWhite,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
        aspectRatioPickerButtonHidden: true,
        aspectRatioLockEnabled: true,
      ),
    );

    print(croppedFile.path);

    return croppedFile;
  }
}
