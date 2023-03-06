import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../StudentHomeScreen.dart';

class LibraryOpeningHours extends StatelessWidget {
  const LibraryOpeningHours({super.key});

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
              height: 32,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Opening Hours",
                      style: TextStyle(
                          letterSpacing: 1.3,
                          fontSize: 24,
                          color: Color(0xff164F93),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Opening Timings",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  LibraryCard(
                      imagePath: "assets/images/availability.png",
                      title: "10:00 AM to 04:00 PM \n Mon-Sun"),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Closing Timings",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  LibraryCard(
                      imagePath: "assets/images/availability.png",
                      title: "4:00 PM to 09:00 AM \n Mon-Sun"),
                  const SizedBox(
                    height: 50,
                  ),
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
                            "Note",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "The library will remain closed on date due to xyz circumstances.",
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
            )
          ],
        ),
      ),
    );
  }
}

class LibraryCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const LibraryCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
