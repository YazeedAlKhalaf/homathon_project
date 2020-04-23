class User {
  String uid;
  String firstName; // real first name
  String lastName; // real last name
  String username; // nickname
  String email;
  String profilePhoto;
  String idNumber;

  User({
    this.uid,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.profilePhoto,
    this.idNumber,
  });

  User.fromJson(Map<String, dynamic> data) {
    this.uid = data['uid'];
    this.firstName = data['firstName'];
    this.lastName = data['lastName'];
    this.username = data['username'];
    this.email = data['email'];
    this.profilePhoto = data['profilePhoto'];
    this.idNumber = data['idNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'profilePhoto': profilePhoto,
      'idNumber': idNumber,
    };
  }
}
