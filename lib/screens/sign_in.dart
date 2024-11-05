
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart'; // Import your Home page
import 'sign_up.dart';  // Create or import the SignUpScreen

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  /*
  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Email and Password
  Future<void> signInWithEmail() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null; // The user canceled the sign-in
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  // Sign in with Apple
  Future<User?> signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return userCredential.user;
  }

  // Function to show error dialogs
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("Okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // signInWithEmail
                Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
              },
              child: Text("Sign in with Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // User? user = await signInWithGoogle();
                // if (user != null) {
                //   Navigator.pushReplacement(
                //     // ignore: use_build_context_synchronously
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()),
                //   );
                // } else {
                //   _showErrorDialog("Google Sign-In failed");
                // }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text('Sign In with Google', style: TextStyle(color: Colors.blue),)
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.apple, color: Colors.black,),
              label: Text(
                "Sign in with Apple", 
                style: TextStyle(color: Colors.black),
                ),
              onPressed: () async {
                // User? user = await signInWithApple();
                // if (user != null) {
                //   Navigator.pushReplacement(
                //     // ignore: use_build_context_synchronously
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()),
                //   );
                // } else {
                //   _showErrorDialog("Apple Sign-In failed");
                // }
              },
            ),
            SizedBox(height: 16),
            // Sign-Up Button
            Center(
              child: RichText(text:
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign-up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                      }
                    )
                  ]
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}