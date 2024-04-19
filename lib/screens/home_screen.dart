import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/helper_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() {
    return const MaterialPage<void>(child: HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

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

  List dashNames = [
    "Bills",
    "Disconnect",
    "Transfer",
    "Services",
    "Complain",
    "Update",
    "Connection",
    "Outage",
  ];

  List<ImageIcon> dashIcons = [
    const ImageIcon(
      AssetImage('assets/bills.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage(
        'assets/cloud-disabled.png',
      ),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/customer-care.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/priority-arrows.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bills.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bills.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bills.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bills.png'),
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[700],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.profile_circled,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hello \nThomas",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "   Quick Actions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent[700],
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: dashIcons[index],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(dashNames[index])
                                  ],
                                );

                                //   Padding(
                                //   padding:
                                //       const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(
                                //       color: Colors.transparent,
                                //       image: DecorationImage(image: AssetImage('assets/bills.png'), fit: BoxFit.fill )
                                //     ),
                                //
                                //   ),
                                // );
                              }),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 15,
                        ),




                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       CupertinoIcons.home,
          //     ),
          //     label: 'Home')
        ],
      ),
    );
  }
}
