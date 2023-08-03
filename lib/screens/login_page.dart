import 'package:artravel/screens/signup_page.dart';
import 'package:artravel/screens/welcome_page.dart';
import 'package:artravel/utils/color_utils.dart';
import 'package:artravel/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor('00E5FF'),
          hexStringToColor('18FFFF'),
          hexStringToColor('18FFFF')
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/book.png"),
                SizedBox(height: 20),
                Text('MyNotts',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                reusableTextField('Enter username', Icons.person_outline, false,
                    _emailTextEditingController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter password', Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                loginButton(context, true, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                }),
                SizedBox(height: 5),
                signUpBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account with us?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
