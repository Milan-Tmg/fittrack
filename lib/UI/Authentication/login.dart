import 'package:fittrack/UI/Authentication/authprovider.dart';
import 'package:fittrack/UI/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.of(context).size.width * 0.05;
    final verticalPadding = MediaQuery.of(context).size.height * 0.03;
    final sizedboxheight = MediaQuery.of(context).size.height * 0.07;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    Authprovider provider = Authprovider();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: sizedboxheight),
            textButtom(
              horizontalPadding,
              verticalPadding,
              "Email",
              emailController,
            ),
            textButtom(
              horizontalPadding,
              verticalPadding,
              "password",
              passwordController,
            ),
            SizedBox(height: sizedboxheight),
            buttom(() async {
              bool success = await provider.logInWithEmail(
                emailController.text,
                passwordController.text,
              );
              if (success) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

Widget textButtom(
  final horizontalPadding,
  final verticalPadding,
  String hintText,
  TextEditingController textcontroller,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    ),
    child: TextFormField(
      controller: textcontroller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget buttom(VoidCallback onPressed) {
  return ElevatedButton(onPressed: onPressed, child: Text("Log in"));
}
