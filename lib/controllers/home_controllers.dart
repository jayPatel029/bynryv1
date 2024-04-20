import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bynryv1/models/models.dart';
import 'package:bynryv1/screens/home/components/home_comp.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeController {
  final user = FirebaseAuth.instance.currentUser;

  List<ViewBills> viewBills = [
    ViewBills(
        billName: 'Light Bill',
        date: '20 Jan 2020',
        amount: '430',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
    ViewBills(
        billName: 'Food',
        date: '20 Feb 2020',
        amount: '100',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
    ViewBills(
        billName: 'Car',
        date: '20 Mar 2020',
        amount: '4300',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
    ViewBills(
        billName: 'Home',
        date: '20 Apr 2020',
        amount: '4300',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
    ViewBills(
        billName: 'Bills',
        date: '20 Jan 2020',
        amount: '43',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
    ViewBills(
        billName: 'Bills',
        date: '20 Jan 2020',
        amount: '43',
        icon: CupertinoIcons.circle,
        description: 'Add your bill description here!!'),
  ];

  List<String> dashNames = [
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
      AssetImage('assets/bill.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage(
        'assets/disconnect.png',
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
      AssetImage('assets/bill.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bill.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bill.png'),
      size: 30,
    ),
    const ImageIcon(
      AssetImage('assets/bill.png'),
      size: 30,
    ),
  ];

  Widget buildBody(BuildContext context) {
    return HomeBody(
      viewBills: viewBills,
      onTapBill: (bill) => showPaymentDialog(context, bill),
      dashNames: dashNames,
      dashIcons: dashIcons,
      onTapIcon: onTapIcon,
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavBar();
  }

  void onTapIcon(int index) {
    switch (index) {
      case 0:
        Get.snackbar("Feature Under development","Stay tuned for updates!",
            colorText: Colors.white, backgroundColor: Colors.orange[700]);
        print('Tapped on ${dashNames[index]}');
        break;
      case 1:
        Get.snackbar("Feature Under development","Stay tuned for updates!",
            colorText: Colors.white, backgroundColor: Colors.orange[700]);
        print('Tapped on ${dashNames[index]}');
        break;

      default:
        break;
    }
  }

  Future<void> showLogoutDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutDialog(userEmail: user!.email!);
      },
    );
  }

  void showPaymentDialog(BuildContext context, ViewBills bill) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PaymentDialog(bill: bill);
      },
    );
  }
}
