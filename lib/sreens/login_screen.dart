
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase_signin/flutter_devcamp2024_ui.dart';
import 'package:flutter_devcamp_firebase_signin/sreens/register_screen.dart';
import 'package:flutter_devcamp_firebase_signin/utils/validation.dart';
import 'package:flutter_devcamp_firebase_signin/widgets/custom_solid_button.dart';
import 'package:flutter_devcamp_firebase_signin/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const FlutterDevCamp2024UI()));
        }
      } on FirebaseAuthException {
        rethrow;
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed to Login")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset('assets/gif/firebase_flutter.gif'),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  label: 'Email',
                  validator: (val) => Validators.emailValidation(val),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  validator: (val) => Validators.passwordValidation(val),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomSolidButton(onPressed: _login, buttonText: 'Login'),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const RegisterScreen()));
                    },
                    child: const Text('Don\'t have an account? Register'))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}