import 'package:emanpanel/Screens/LoginSelection.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginSelection()));
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
