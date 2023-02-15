import 'package:emanpanel/Screens/HomeScreen.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:emanpanel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc(),
      child: GetMaterialApp(

        title: 'Eman Smart Panel',
        theme: ThemeData(
          primaryColor: Color(0xff091b3e),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
