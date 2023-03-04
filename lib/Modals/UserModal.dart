import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  static List<UserModal> user = [];
}

class UserModal {
  final String userName;
  final String espID;
  final String semesterNo;
  final String program;
  final String email;
  final String phoneNumber;
  final String password;

  UserModal(
      {required this.userName,
      required this.espID,
      required this.password,
      required this.semesterNo,
      required this.program,
      required this.email,
      required this.phoneNumber});

  static UserModal fromSnapshot(DocumentSnapshot snapshot) {
    return UserModal(
        userName: snapshot["userName"],
        espID: snapshot["espID"],
        password: snapshot["password"],
        semesterNo: snapshot["semesterNo"],
        program: snapshot["program"],
        email: snapshot["email"],
        phoneNumber: snapshot["phoneNumber"]);
  }
}
