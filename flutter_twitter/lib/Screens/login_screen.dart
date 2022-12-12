import 'package:flutter/material.dart';
import 'package:flutter_twitter/service/auth_service.dart';
import 'package:flutter_twitter/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email',
              ),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: () async {
                bool isValid = await AuthService.login(emailController.text,passwordController.text);
                if(isValid) {
                  Navigator.pop(context);
                } else {
                  print('login problem');
                }
              },
              child: const RoundedButton(
                btnText: 'LOG IN')
            ),
          ],
        ),
      ),
    );
  }
}