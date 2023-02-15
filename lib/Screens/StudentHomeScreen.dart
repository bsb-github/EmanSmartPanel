import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:emanpanel/Screens/StudentScreens/Complains.dart';
import 'package:emanpanel/Screens/StudentScreens/Contact.dart';
import 'package:emanpanel/Screens/StudentScreens/MainScreenStudent.dart';
import 'package:emanpanel/Screens/StudentScreens/News.dart';
import 'package:emanpanel/Screens/StudentScreens/Profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int _bottomNavIndex = 4;
  var screen = [
    Profile(),
    Complain(),
    Contact(),
    News(),
  ];
  final iconList = <IconData>[
    FontAwesomeIcons.user,
    Icons.email_outlined,
    FontAwesomeIcons.contactBook,
    FontAwesomeIcons.newspaper,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _bottomNavIndex == 4 ? MainScreenStudent() : screen[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
        onPressed: () {
          setState(() {
            _bottomNavIndex = 4;
          });
        },
        child: Center(
          child: Icon(
            FontAwesomeIcons.home,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
