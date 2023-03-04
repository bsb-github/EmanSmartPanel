import 'dart:convert';
import 'package:emanpanel/Modals/SubjectModal.dart';
import 'package:http/http.dart' as http;

class GetData {
  static void getSubjects() async {
    await http
        .get(Uri.parse("https://emaanpanel.up.railway.app/allSubjects"))
        .then((value) {
      var data = jsonDecode(value.body);
      for (var i = 0; i < data["result"].length; i++) {
        AllSubjects.allSubjects.add(SubjectModal.fromJson(data["result"][i]));
      }
      print(AllSubjects.allSubjects.first.id);
    });
  }
}
