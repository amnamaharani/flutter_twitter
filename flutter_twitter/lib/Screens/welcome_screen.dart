import 'package:flutter/material.dart';
import 'package:flutter_twitter/Screens/login_screen.dart';
import 'package:flutter_twitter/Screens/registration_screen.dart';

import '../widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width),
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                  width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20
                  ),
                  child: Text(
                    'See what is happening in the world right now',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const RoundedButton(
                    btnText: 'LOG IN',
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                    );
                  },
                  child: const RoundedButton(
                    btnText: 'Create Account',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}