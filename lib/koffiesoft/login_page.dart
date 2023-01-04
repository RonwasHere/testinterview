import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              'Welcome back. ',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 70),
            TextFormField(
              style: GoogleFonts.openSans(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Color(0xff262A34),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Email',
                hintStyle: GoogleFonts.openSans(
                  color: Color(0xff6F7075),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              style: GoogleFonts.openSans(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Color(0xff262A34),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Password',
                hintStyle: GoogleFonts.openSans(
                  color: Color(0xff6F7075),
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Color(0xff6F7075),
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              alignment: Alignment(1, 0.5),
              child: Text(
                'Forgot My Password',
                style: GoogleFonts.poppins(
                  color: Color(0xff6A6B70),
                ),
              ),
            ),
            SizedBox(height: 117),
            Center(
              child: Container(
                width: 295,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFCAC15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Color(0xff6B4909),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have account?",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //Function login
  Future<void> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var respon = await http.post(
          Uri.parse(
              'https://grinder.koffiesoft.com/docs#/Authentication/login_login_post'),
          body: ({
            'email': emailController.text,
            'password': passwordController.text
          }));
      if (respon.statusCode == 200) {
        Navigator.pushNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('email / password salah')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank Field Not Allowwed')));
    }
  }
}
