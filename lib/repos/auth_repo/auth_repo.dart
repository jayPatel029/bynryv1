import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';





class AuthRepository {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithUsernamePassword(String email, String password) async {
    try{
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password') {
        print("The password is too weak.");
      } else if(e.code == 'email-already-in-use') {
        print("the account already exists for that email");
      }

      return null;
    }
  }
}











// import '../models/user_model.dart';
//
// class AuthRepository {
//   final firebase_auth.FirebaseAuth _firebaseAuth;
//
//   AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
//       : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
//
//   var currentUser = User.empty;
//
//   Stream<User> get user {
//     return _firebaseAuth.authStateChanges().map((firebaseUser) {
//       final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
//       currentUser = user;
//       return user;
//     });
//   }
//
//   Future<void> signup({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } catch (e) {}
//   }
//
//   Future<void> loginWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } catch (e) {}
//   }
//
//   Future<void> logout() async {
//     try {
//       await Future.wait([_firebaseAuth.signOut()]);
//     } catch (e) {}
//   }
// }
//
// extension on firebase_auth.User {
//   User get toUser {
//     return User(id: uid, email: email, name: displayName, photo: photoURL);
//   }
// }



