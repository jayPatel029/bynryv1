// import 'package:bynryv1/screens/wrapper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Verify extends StatefulWidget {
//   const Verify({super.key});
//
//   @override
//   State<Verify> createState() => _VerifyState();
// }
//
// class _VerifyState extends State<Verify> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     sendVerfiyLink();
//     super.initState();
//   }
//
//   sendVerfiyLink() async {
//     final user = FirebaseAuth.instance.currentUser!;
//     await user.sendEmailVerification().then((value) => {
//           Get.snackbar('Link sent', 'A link has been send ot your email',
//               margin: EdgeInsets.all(30), snackPosition: SnackPosition.TOP)
//         });
//   }
//
//   reload() async {
//     await FirebaseAuth.instance.currentUser!
//         .reload()
//         .then((value) => {Get.offAll(Wrapper())});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurpleAccent[700],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Verification",
//           style: TextStyle(fontSize: 30, color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(28.0),
//         child: Center(
//           child: Text(
//             "Open your mail and click on the link provided to verify email & reload thispage",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           reload();
//         },
//         child: Icon(Icons.restart_alt_rounded, color: Colors.deepPurpleAccent[700],),
//       ),
//     );
//   }
// }
