import 'dart:convert';

import 'package:http/http.dart' as http;

//masih bingung tentang ini....
class PostResult {
  late String email;
  late String hp;
  late String firstname;
  late String lastname;
  late String group;
  late String role;
  late String tgl_lahir;
  late String jenis_kelamin;

  PostResult({
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.group,
    required this.role,
    required this.tgl_lahir,
    required this.jenis_kelamin,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        email: object['email'],
        hp: object['hp'],
        firstname: object['firstname'],
        lastname: object['lastname'],
        group: object['group'],
        role: object['role'],
        tgl_lahir: object['tgl_lahir'],
        jenis_kelamin: object['jenis_kelamin']);
  }

  static Future<PostResult> connecToAPI(String email, String hp) async {
    String apiURL = "";

    var apiResult =
        await http.post(Uri.parse(apiURL), body: {"email": email, "hp": hp});
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
