class User {
  String uid;
  String firstName; // real name
  String lastName; // real name
  String username; // nickname
  String email;
  String profilePhoto;

  User({
    this.uid,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.profilePhoto,
  });

  User.fromJson(Map<String, dynamic> data) {
    this.uid = data['uid'];
    this.firstName = data['firstName'];
    this.lastName = data['lastName'];
    this.username = data['username'];
    this.email = data['email'];
    this.profilePhoto = data['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'profilePhoto': profilePhoto,
    };
  }
}
