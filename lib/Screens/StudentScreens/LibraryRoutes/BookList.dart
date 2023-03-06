import 'package:emanpanel/Screens/StudentScreens/LibraryRoutes/BookIssueData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../StudentHomeScreen.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
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
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32),
        child: Column(
          children: [
            Center(
              child: Text(
                "List of Books",
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
            GestureDetector(
                onTap: () {
                  Get.to(BookIssueData());
                },
                child: BookTile()),
            BookTile(),
            BookTile(),
            BookTile(),
            BookTile(),
          ],
        ),
      ),
    ])));
  }
}

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 70,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset("assets/images/book.png"),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Book Title",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Author Name",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
