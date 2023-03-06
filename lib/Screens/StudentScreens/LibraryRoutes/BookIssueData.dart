import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../StudentHomeScreen.dart';

class BookIssueData extends StatelessWidget {
  const BookIssueData({super.key});

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
                "Issue Data",
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
                "Book Issued",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BookInfoWidget(
              type: "Issue\nDate",
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Return Date",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BookInfoWidget(
              type: "Return\nDate",
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Fines & Charges",
                style: TextStyle(
                    letterSpacing: 1.3,
                    fontSize: 24,
                    color: Color(0xff164F93),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Color(0xff164F93))),
              child: Center(
                child: Text(
                  "Fine will be charged after Due Date of return.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}

class BookInfoWidget extends StatelessWidget {
  final String type;
  const BookInfoWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: 85,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Book Name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("Author")
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/timeline.png",
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                type,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
