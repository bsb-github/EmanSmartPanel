import 'package:emanpanel/Modals/UserModal.dart';
import 'package:emanpanel/Screens/LoginSelection.dart';
import 'package:emanpanel/Screens/StudentScreens/Courses.dart';
import 'package:emanpanel/Screens/StudentScreens/LibraryHome.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/Widgets/NewsCard.dart';

class MainScreenStudent extends StatefulWidget {
  const MainScreenStudent({super.key});

  @override
  State<MainScreenStudent> createState() => _MainScreenStudentState();
}

class _MainScreenStudentState extends State<MainScreenStudent> {
  var userData = Users.user.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 - 5,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                            ),
                            Text(
                              "Emaan Smart Panel",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginSelection(),
                                    ));
                              },
                              child: Icon(
                                FontAwesomeIcons.signOut,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 100,
                        child: Row(children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Syed Ahsan",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                userData.program,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "News",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 30),
                        ),
                        const SizedBox(height: 12.0),
                        CarouselSlider(
                            items: [
                              const NewsCard(),
                              const NewsCard(),
                              const NewsCard(),
                              const NewsCard()
                            ],
                            options: CarouselOptions(
                              height: 85,
                              enableInfiniteScroll: true,
                              viewportFraction: 1,
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 5),
                              autoPlayInterval: const Duration(seconds: 100),
                              //   autoPlayCurve: CurSlowIn,
                              autoPlay: true,
                            )),
                        SizedBox(
                          child: GridView(
                            shrinkWrap: true,
                            semanticChildCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.2, crossAxisCount: 2),
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CoursesScreen(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff164F93),
                                            Color(0xff091B3E),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/course.png"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Courses",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff164F93),
                                            Color(0xff091B3E),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/academic.png"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Academic \n Calender",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff164F93),
                                            Color(0xff091B3E),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/assign.png"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Assignments",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LibraryHome(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff164F93),
                                            Color(0xff091B3E),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/library.png"),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Library",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
