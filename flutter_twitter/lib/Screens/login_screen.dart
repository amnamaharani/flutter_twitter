import 'package:flutter/material.dart';
import 'package:flutter_twitter/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00acee),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Log in',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 40,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 40,),
            const RoundedButton(btnText: 'LOG IN'),
          ],
        ),
      ),
    );
  }
}