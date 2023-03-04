import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emanpanel/Helpers/GetData.dart';
import 'package:emanpanel/Screens/LoginSelection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modals/UserModal.dart';
import 'StudentHomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkIfLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("espID")) {
      String? espID = prefs.getString("espID");
      String? password = prefs.getString("password");
      var data =
          await FirebaseFirestore.instance.collection("Users").doc(espID).get();
      Users.user.add(UserModal.fromSnapshot(data));
      if (Users.user.first.password == password) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHomeScreen(),
            ));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginSelection()));
    }
  }

  @override
  void initState() {
    GetData.getSubjects();
    Future.delayed(Duration(seconds: 2)).then((value) {
      checkIfLoggedIn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff164F93),
            Color(0xff091B3E),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: Image.asset("assets/images/emaan.png"),
        ),
      ),
    );
  }
}
