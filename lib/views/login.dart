import 'package:flutter/material.dart';
import 'package:dreamscape/views/privacy_policy.dart';
import 'package:dreamscape/constants/colours.dart';

import '../auth/auth.dart';

//login screen widget
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//login screen state
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _passwordVisible = false;

  void showRegistrationFailedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Registration failed.',
          style: TextStyle(fontSize: 18),
        ),
        duration: Duration(seconds: 4),
        backgroundColor: customLilac,
      ),
    );
  }

  void showLoginFailedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Incorrect email or password.',
          style: TextStyle(fontSize: 18),
        ),
        duration: Duration(seconds: 4),
        backgroundColor: customLilac,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhite,
      appBar: AppBar(
          title: const Text(
            'DreamScape',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: customLilac,
          foregroundColor: customWhite,
          toolbarHeight: MediaQuery.of(context).size.height / 6,
          leading: Container(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(1290, 250),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 20),
              emailTextbox(),
              const SizedBox(height: 20),
              passwordTextbox(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage()),
                  );
                },
                child: Text(
                  "View our Privacy Policy",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: customAzure,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  registerButton(),
                  loginButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () async {
        bool loginSuccessful =
            await signInUser(emailController.text, passwordController.text);
        if (!loginSuccessful) {
          showLoginFailedMessage();
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: customPurple,
          foregroundColor: Colors.white,
          minimumSize: const Size(120, 55)),
      child: const Text(
        'Sign In',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      onPressed: () async {
        bool nameConfirmed = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('What would you like to be called?'),
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
        if (nameConfirmed) {
          bool registrationSuccessful = await registerUser(emailController.text,
              passwordController.text, nameController.text);
          if (!registrationSuccessful) {
            showRegistrationFailedMessage();
          }
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: customPurple,
          foregroundColor: Colors.white,
          minimumSize: const Size(120, 55)),
      child: const Text(
        'Register',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget passwordTextbox() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(fontSize: 20),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: customPurple,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          style: const TextStyle(fontSize: 20, color: Colors.black),
          cursorColor: customBlack,
          obscureText: !_passwordVisible,
        ));
  }

  Widget emailTextbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: emailController,
        decoration: const InputDecoration(
            labelText: 'Email', labelStyle: TextStyle(fontSize: 20)),
        style: const TextStyle(fontSize: 20, color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget image() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 235,
          height: 240,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        ));
  }
}
