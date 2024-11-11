
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/home.dart'; // Import your Home page
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
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
                    context.read<AuthBloc>().add(SignInWithEmailEvent(
                        email: _emailController.text,
                        password: _passwordController.text));
              },
              child: Text("Sign in with Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                context.read<AuthBloc>().add(SignInWithGoogleEvent());
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
                context.read<AuthBloc>().add(SignInWithAppleEvent());
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
            );
          },
        ),
      ),
    );
  }
}