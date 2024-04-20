import 'package:bynryv1/screens/forgot_pass.dart';
import 'package:bynryv1/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/helper_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {


      String errorMessage = _mapFirebaseAuthErrorCode(e.code);
      Get.snackbar("Authentication Error", errorMessage,
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('FirebaseAuthException: $errorMessage');


      if (e.code == 'wrong-password') {
        passwordController.clear();
      }

    } on PlatformException catch (e) {

      Get.snackbar("Platform Error", e.message ?? "An unknown error occurred");
      print('PlatformException: ${e.message}');
    } catch (e) {


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
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurpleAccent[700],
            ),
          )
        : Scaffold(
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
                          "Welcome Back!",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login to your account",
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
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  CustomTextfield(
                                    hint: "Enter the EmailID",
                                    controller: emailController,
                                    // validator: _validateEmail,
                                  ),
                                  CustomTextfield(
                                    hint: "Password",
                                    controller: passwordController,
                                    // validator: _validatePassword,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(ForgotPass());

                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                                color: Colors.deepPurple[700],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 55,
                                  ),
                                  CustomButton(
                                    Bname: 'Login',
                                    onTap: () {
                                      login();
                                    },height: 40, width: 280,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60, 360, 60, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont have an Account? ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(const RegisterScreen());

                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            Colors.deepPurpleAccent[700],
                                        fontSize: 16,
                                        color: Colors.deepPurpleAccent[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
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
