import 'package:flutter/material.dart';
import 'package:flutter_twitter/service/auth_service.dart';
import 'package:flutter_twitter/theme/colors.dart';
import 'package:flutter_twitter/widgets/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTweeterColor,
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
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'name',
              ),
            ),
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
                bool isValid = await AuthService.signUp(nameController.text,emailController.text,passwordController.text);
                if(isValid) {
                  Navigator.pop(context);
                } else {
                  print('something wrong');
                }
              },
              child: const RoundedButton(
                btnText: 'Create account')
            ),
          ],
        ),
      ),
    );
  }
}