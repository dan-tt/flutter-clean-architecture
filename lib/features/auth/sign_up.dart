import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
          if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'Full name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Dispatch the SignUp event
                        context.read<AuthBloc>().add(
                              SignUpWithEmailEvent(
                                name: _fullNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
              },
              child: Text('Sign Up'),
            ),
          ],
        );
        }, listener: (context, state) {
          if (state is AuthSuccess) {
                  // Navigate back to the Sign-In screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-Up Successful!')),
      );
      Navigator.pop(context); // Navigates back to Sign-In screen
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
        }) 
      ),
    );
  }
}
