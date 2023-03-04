import 'package:emanpanel/Modals/UserModal.dart';
import 'package:emanpanel/Screens/LoginSelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userData = Users.user.first;
  TextEditingController _idController = TextEditingController();
  TextEditingController _programController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _idController.text = userData.espID;
      _programController.text = userData.program;
      _emailController.text = userData.email;
      _phoneController.text = userData.phoneNumber;
    });
    super.initState();
  }

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
                  Container(
                    height: 35,
                    width: 35,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      EasyLoading.show();
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      EasyLoading.dismiss();
                      Get.to(LoginSelection());
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
            height: 30,
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(75)),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            userData.userName,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 4,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.idCard,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _idController.text,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset("assets/images/degreeProgram.png"),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _programController.text,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.phone,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _phoneController.text,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _emailController.text,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
