import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:konect_desktop/pages/HomePage.dart';
import 'package:konect_desktop/pages/login/SignUpPage.dart';
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

        print(name);


        if(name!=null && imageUrl!=null && userEmail!=null){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("name", name!);
          prefs.setString("imageUrl", imageUrl!);
          prefs.setString("email", userEmail!);
          _checkUserExistOrNot(name! , imageUrl!,userEmail!);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _checkUserExistOrNot(String name,String imageUrl,String userEmail) async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.doc('Users/$name').get();
      if (documentSnapshot.exists) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(auth: true,name: name,imageUrl: imageUrl,email: userEmail,)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage(name: name,email: userEmail,uid: uid!,)),
        );
      }
    } catch (e) {
      print('Error while checking user existence: $e');
      // Handle the error as needed
    }
  }



}

