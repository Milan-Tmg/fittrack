import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fittrack/UI/Authentication/siginin.dart';
//import 'package:fittrack/UI/presentation/home_screen.dart';
import 'package:fittrack/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFFEDEDED),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff919191)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FitTrack(),
    ),
  );
}

class FitTrack extends StatefulWidget {
  const FitTrack({super.key});

  @override
  State<FitTrack> createState() => _FitTrackState();
}

class _FitTrackState extends State<FitTrack> {
  @override
  Widget build(BuildContext context) {
    final screenWidhth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/FittrackLogo.png",
              height: screenHeight * 0.3,
              width: screenWidhth * 0.6,
              fit: BoxFit.contain,
            ),

            DefaultTextStyle(
              style: TextStyle(
                fontSize: 30,

                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "FitTrack",
                    speed: Duration(milliseconds: 150),
                    cursor: '',
                  ),
                ],
                onFinished: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Siginin()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
