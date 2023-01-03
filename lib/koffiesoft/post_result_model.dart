import 'package:http/http.dart' as http;

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
}
