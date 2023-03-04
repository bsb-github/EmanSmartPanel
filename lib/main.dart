import 'package:emanpanel/Screens/HomeScreen.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:emanpanel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue[900]
    ..backgroundColor = Colors.blue[900]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
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
        builder: EasyLoading.init(),
      ),
    );
  }
}
