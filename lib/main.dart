import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:konect_desktop/pages/HomePage.dart';
import 'package:konect_desktop/pages/googleSignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAFa4kxyu9c5dwABNb6jRqAG1_IoXgXr78",
          authDomain: "notificationmana-746b8.firebaseapp.com",
          projectId: "notificationmana-746b8",
          storageBucket: "notificationmana-746b8.appspot.com",
          messagingSenderId: "213831139367",
          appId: "1:213831139367:web:271d66a762cfa206638e02",
          measurementId: "G-77YHLV8XPH"
      )
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isAuthenticated = prefs.getBool('auth');

  runApp(MyApp(isAuthenticated: isAuthenticated ?? false));
}



class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({Key? key, required this.isAuthenticated}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isAuthenticated ? const HomePage() : const GoogleSignInButton(),
    );
  }
}
