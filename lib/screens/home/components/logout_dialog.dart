import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutDialog extends StatelessWidget {
  final String userEmail;

  LogoutDialog({required this.userEmail});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(userEmail),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('LogOut'),
          onPressed: () async {
            await _auth.signOut();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
