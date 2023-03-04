import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emanpanel/Modals/UserModal.dart';
import 'package:emanpanel/Screens/StudentHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/PasswordEncrypter.dart';

class LoginSelection extends StatefulWidget {
  const LoginSelection({super.key});

  @override
  State<LoginSelection> createState() => _LoginSelectionState();
}

class _LoginSelectionState extends State<LoginSelection> {
  TextEditingController _espIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  PasswordEncrypter encrypter = PasswordEncrypter();

  Future<void> signIn(String espID, String passowrd) async {
    EasyLoading.show();
    var data =
        await FirebaseFirestore.instance.collection("Users").doc(espID).get();
    var encryptedPassword = encrypter.encrpyt(passowrd);
    final prefs = await SharedPreferences.getInstance();
    if (data.exists) {
      Users.user.add(UserModal.fromSnapshot(data));
      if (Users.user.first.password == encryptedPassword) {
        prefs.setString('espID', espID);
        prefs.setString('password', encryptedPassword);
        EasyLoading.dismiss();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHomeScreen(),
            ));
      } else {
        EasyLoading.showError("Incorrect Password");
        EasyLoading.dismiss();
        Get.snackbar("Incorrect Password", "Please Enter Correct Password",
            backgroundColor: Theme.of(context).primaryColor,
            colorText: Colors.white);
      }
    } else {
      EasyLoading.showError("Incorrect ID");
      EasyLoading.dismiss();
      Get.snackbar("Student Doesn't Exist", "Contact Administrator",
          backgroundColor: Theme.of(context).primaryColor,
          colorText: Colors.white);
    }
  }

  void createUser() async {
    await FirebaseFirestore.instance.collection("Users").doc("ESP1022").set({
      "userName": "Bismillah Sharif",
      "espID": "ESP1022",
      "password": encrypter.encrpyt("123456"),
      "semesterNo": "2",
      "program": "Bachelor of Computer Science",
      "email": "bsb@esp.edu.pk",
      "phoneNumber": "03125063336"
    });
  }

  @override
  void initState() {
    //createUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 100),
                      bottomRight: Radius.elliptical(200, 100)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff164F93),
                      Color(0xff091B3E),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  )),
              child: Center(
                child: Image.asset("assets/images/login.png"),
              ),
            )),
        const SizedBox(
          height: 30,
        ),
        Form(
          child: Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _espIdController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: "ESP ID",
                          hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 5)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 5)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            signIn(_espIdController.text,
                                _passwordController.text);
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff164F93),
                                    Color(0xff091B3E),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )),
                            child: const Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        )
      ]),
    );
  }
}
