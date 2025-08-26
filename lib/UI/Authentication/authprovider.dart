import 'package:firebase_auth/firebase_auth.dart';

class Authprovider {
  final auth = FirebaseAuth.instance;

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.message);
        return false;
      }
    }
    return false;
  }

  void signInWithGmail() {}

  void signInWithFacebook() {}

  Future<bool> logInWithEmail(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          print('wrong emial');
          break;

        case 'wrong-password':
          print("wrong pass");
          break;

        default:
          print("${e.message}-${e.message}");
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
