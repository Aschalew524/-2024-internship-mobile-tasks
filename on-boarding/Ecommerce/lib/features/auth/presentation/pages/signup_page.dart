import 'package:flutter/material.dart';

import '../common/input_field/input_field.dart';
import '../common/logo/logo.dart';
import 'signin_page.dart';

class SignupPage extends StatefulWidget {
  static route()=> MaterialPageRoute(builder: (context)=>const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(44.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  logo(),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Create your account',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 47.0,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _nameController,
                hintText: 'Ex: Abebe',
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _emailController,
                hintText: 'abebe222@gmail.com',
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _passwordController,
                hintText: '**************',
                obscureText: true,
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: '**************',
                obscureText: true,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (value) {
                      setState(() {
                        _termsAccepted = value!;
                      });
                    },
                  ),
                  const Text(
                    'I understand the terms & privacy.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-up logic here
                  final name = _nameController.text;
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;

                  // Handle the sign-up logic with the above variables
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, SigninPage.route());
                    },
                    child: const Text('SIGN IN'),
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