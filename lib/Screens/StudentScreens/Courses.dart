import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

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
                    Image.asset("assets/images/course.png"),
                    Icon(
                      FontAwesomeIcons.signOut,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Bachelor of Computer Science",
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xff112F53),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "First Year BSCS",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "2nd Semester",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff164F93),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, //New
                        blurRadius: 25.0,
                        offset: Offset(0, -10))
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff164F93),
                              Color(0xff091B3E),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Course \n Code",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24.0),
                          ),
                          Text(
                            "Title",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24.0),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                    CourseTile(
                      courseCode: "CSS 101",
                      courseTitle: "Introduction to ICT",
                    ),
                    //   Divider(),
                    CourseTile(
                      courseCode: "CSS 1021",
                      courseTitle: "Programming\nFundamentals",
                    ),
                    //   Divider(),
                    CourseTile(
                      courseCode: "GED 1021",
                      courseTitle: "English Composition",
                    ),
                    CourseTile(
                      courseCode: "MTH 1011",
                      courseTitle: "Calculas & Analytic\nGeometry",
                    ),
                    CourseTile(
                      courseCode: "PHY 1041",
                      courseTitle: "Applied Physics",
                    ),
                    CourseTile(
                      courseCode: "GED 1032",
                      courseTitle: "Pakistan Studies",
                    ),
                    //   Divider()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String courseCode;
  final String courseTitle;

  const CourseTile({
    super.key,
    required this.courseCode,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            courseCode,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
          Text(
            courseTitle,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
          Container(
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }
}
