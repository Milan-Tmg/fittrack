import 'package:fittrack/UI/Authentication/authprovider.dart';
import 'package:fittrack/UI/Authentication/login.dart';
import 'package:fittrack/UI/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class Siginin extends StatefulWidget {
  const Siginin({super.key});

  @override
  State<Siginin> createState() => _SigininState();
}

class _SigininState extends State<Siginin> {
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.of(context).size.width * 0.05;
    final verticalPadding = MediaQuery.of(context).size.height * 0.03;
    final sizedboxheight = MediaQuery.of(context).size.height * 0.07;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
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
            textButtom(
              horizontalPadding,
              verticalPadding,
              "Confrim Password",
              confirmPasswordController,
            ),
            SizedBox(height: sizedboxheight),
            buttom(() async {
              bool success = await provider.signInWithEmail(
                emailController.text,
                passwordController.text,
              );
              if (success) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            }),
            SizedBox(height: sizedboxheight),
            Text("Already have an account"),
            Center(
              child: TextButton(
                child: Text("login"),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
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
  return ElevatedButton(onPressed: onPressed, child: Text("Sign in"));
}
