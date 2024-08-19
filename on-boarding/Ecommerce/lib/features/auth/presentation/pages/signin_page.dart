import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/input_field/input_field.dart';
import '../common/logo/logo.dart';
import 'signup_page.dart';

class SigninPage extends StatefulWidget {
  static route()=> MaterialPageRoute(builder: (context)=>const SigninPage());
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(44.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(),
                ],
              ),
              const SizedBox(height: 60.0),
              const Text(
                'Sign into your account',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _emailController,
                hintText: 'abebe1233@gmail.com',
              ),
              const SizedBox(height: 15.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _passwordController,
                hintText: '*********************',
                obscureText: true,
              ),
              const SizedBox(height: 35.0),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-in logic here
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  // Handle the sign-in logic with the above variables
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 120.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      
                     Navigator.push(context, SignupPage.route());
                    },
                    child: const Text('SIGN UP'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
