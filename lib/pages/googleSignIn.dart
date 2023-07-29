import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:konect_desktop/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? name, imageUrl, userEmail, uid;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: InkWell(
            onTap: (){
              signInWithGoogle();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text('Sign In with Google'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;
    // The `GoogleAuthProvider` can only be
    // used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
      await auth.signInWithPopup(authProvider);
      final User? user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);
        prefs.setString("name", name!);
        prefs.setString("imageUrl", imageUrl!);
        print("name: $name");
        print("userEmail: $userEmail");
        print("imageUrl: $imageUrl");

        // Navigate to home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()), // Replace 'HomePage' with your actual home page widget
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
