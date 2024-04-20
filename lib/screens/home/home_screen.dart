import 'dart:core';

import 'package:bynryv1/controllers/home_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/helper_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;

  String dropDownVal = 'one';

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${user!.email}'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('LogOut'),
              onPressed: () {
                logOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent[700],
          leading: CustomIcon(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            CustomIcon(
              icon: const Icon(
                CupertinoIcons.profile_circled,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                _dialogBuilder(context);
              },
            ),
            CustomIcon(
              icon: const Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: controller.buildBody(context),
        bottomNavigationBar: controller.buildBottomNavigationBar(context),
      ),
    );
  }
}
