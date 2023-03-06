import 'package:emanpanel/Screens/StudentHomeScreen.dart';
import 'package:emanpanel/Screens/StudentScreens/LibraryRoutes/BookList.dart';
import 'package:emanpanel/Screens/StudentScreens/LibraryRoutes/LibraryOpeningHours.dart';
import 'package:emanpanel/Screens/StudentScreens/MainScreenStudent.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LibraryHome extends StatelessWidget {
  const LibraryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xff164F93),
                  Color(0xff091B3E),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Library",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentHomeScreen(),
                            ));
                      },
                      child: Icon(
                        FontAwesomeIcons.home,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LibraryCard(
              imagePath: "assets/images/availability.png",
              title: "Opening Hour",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LibraryOpeningHours(),
                    ));
              },
            ),
            LibraryCard(
              imagePath: "assets/images/book.png",
              title: "List of Books",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookList(),
                    ));
              },
            ),
            LibraryCard(
              imagePath: "assets/images/wallet.png",
              title: "Fines & Charges",
              onTap: () {
                print("tapped");
              },
            ),
            Spacer(),
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "Disclaimer",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.Maecenas porttitor congue massa. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final void Function() onTap;
  const LibraryCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(imagePath),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
