import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';



Future<String?> signIn() async {
   FirebaseAuth _auth = FirebaseAuth.instance;
   GoogleSignIn googleSignIn = GoogleSignIn();
  // Initialize Firebase
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
  final User? user = userCredential.user;

  print('Google sign in successful');

  String? token;

  await user!.getIdToken().then((value) {
    token = value;
  });

  return token;
}

void signOut(BuildContext context) async{
   FirebaseAuth _auth = FirebaseAuth.instance;
   GoogleSignIn googleSignIn = GoogleSignIn();
   SharedPreferences prefs = await SharedPreferences.getInstance();
  await googleSignIn.signOut();
  await _auth.signOut();
  prefs.clear();
   print('All data cleared !!!');
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
}
