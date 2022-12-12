import 'package:flutter/material.dart';
import 'package:flutter_twitter/widgets/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email;
  late String _password;
  late String _name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Registration',
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
                hintText: 'name',
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 20,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'email',
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 40,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 40,),
            const RoundedButton(btnText: 'Create account'),
          ],
        ),
      ),
    );
  }
}