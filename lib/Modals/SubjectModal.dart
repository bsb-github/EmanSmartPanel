class AllSubjects {
  static List<SubjectModal> allSubjects = [];
}

class SubjectModal {
  final String name;
  final String id;
  final String pre_req;
  final String credit_hours;
  final String type;

  SubjectModal(
      {required this.name,
      required this.id,
      required this.pre_req,
      required this.credit_hours,
      required this.type});

  static SubjectModal fromJson(Map<String, dynamic> json) {
    return SubjectModal(
        name: json["name"],
        id: json["id"],
        pre_req: json["pre_req"],
        credit_hours: json["credit_hours"],
        type: json["type"]);
  }
}
