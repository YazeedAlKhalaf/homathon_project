import 'package:flutter/cupertino.dart';
import 'package:homathon_project/src/models/user.dart';

class Utils {
  String getFullName({
    @required User currentUser,
  }) {
    String firstName = currentUser.firstName;
    String lastName = currentUser.lastName;

    String fullName = firstName + ' ' + lastName;

    return fullName;
  }
}
