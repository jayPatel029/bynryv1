import 'package:bynryv1/screens/screens.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/helper_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  //
  // String? _validateEmail(String? value) {
  //   if (value == null) {
  //     return 'Please enter your email id';
  //   }
  //   if (!EmailValidator.validate(value)) {
  //     return 'Please enter a valid email address';
  //   }
  //   return null;
  // }
  //
  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   return null;
  // }
  //
  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     register();
  //   }
  // }

  bool isLoading = false;

  // register() async {
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text, password: passwordController.text);
  //   Get.offAll(Wrapper());
  // }

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Successful registration, navigate to the next screen
      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors
      String errorMessage = _mapFirebaseAuthErrorCode(e.code);
      Get.snackbar("Authentication Error", errorMessage,
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('FirebaseAuthException: $errorMessage');

      // Clear password field on weak password
      if (e.code == 'weak-password') {
        passwordController.clear();
      }
      // Focus on the email field
    } on PlatformException catch (e) {
      // Handle specific platform errors (e.g., network issues)
      Get.snackbar("Platform Error", e.message ?? "An unknown error occurred");
      print('PlatformException: ${e.message}');
    } catch (e) {
      // Handle other unexpected errors
      Get.snackbar("Error", "An unexpected error occurred",
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('Unexpected Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  String _mapFirebaseAuthErrorCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Incorrect password';
      case 'user-disabled':
        return 'User account has been disabled';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Login operation is not allowed';
      default:
        return 'An unknown authentication error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.deepPurpleAccent[700]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      height: 450,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CustomTextfield(
                              hint: "Email ID",
                              controller: emailController,
                              // validator: _validateEmail,
                            ),
                            CustomTextfield(
                              hint: "Password",
                              controller: passwordController,
                              // validator: _validatePassword,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              Bname: 'Register',
                              onTap: () {
                                register();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(""),
          ],
        ),
      ),
    );
  }
}
