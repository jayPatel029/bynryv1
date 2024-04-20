import 'package:bynryv1/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bynryv1/components/components.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );


      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {

      String errorMessage = _mapFirebaseAuthErrorCode(e.code);
      Get.snackbar("Authentication Error", errorMessage,
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('FirebaseAuthException: $errorMessage');


      if (e.code == 'weak-password') {
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
                    "Welcome User!",
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
                      height: 350,
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
                              height: 40,
                              width: 280,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("OR"),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              Bname: 'Continue with Google',
                              onTap: () {
                                loginWithGoogle();
                              },
                              height: 40,
                              width: 280,
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
