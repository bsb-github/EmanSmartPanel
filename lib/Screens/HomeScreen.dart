import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:emanpanel/Helpers/PasswordEncrypter.dart';
import 'package:emanpanel/Screens/SplashScreen.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    setData("Admin", "123456");
    super.initState();
  }

  PasswordEncrypter encrypter = PasswordEncrypter();
  void setData(String name, String password) async {
    await FirebaseFirestore.instance.collection("Users").doc("admin").set({
      "user": "espadmin",
      "Password": encrypter.encrpyt(password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectionLostState) {
          return Scaffold(
            body: Center(
              child: Text("No Internet Connection"),
            ),
          );
        } else if (state is ConnectionGainedState) {
          return SplashScreen();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
