import 'package:flutter/material.dart';
import 'package:bynryv1/components/components.dart';
import 'package:bynryv1/models/models.dart';
import 'package:get/get.dart';

class PaymentDialog extends StatelessWidget {
  final ViewBills bill;

  PaymentDialog({required this.bill});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurpleAccent[700],
      title: Text(
        bill.billName,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: ${bill.date}',
            style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            'Bill Description: ${bill.description}',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 70),
          Text(
            "Amount: \$${bill.amount}",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        CustomButton(
          Bname: "Pay",
          onTap: () {
            Get.snackbar("Feature Under development","Stay tuned for updates!",
                colorText: Colors.white, backgroundColor: Colors.orange[700]);
            Navigator.of(context).pop();
          },
          height: 40,
          width: 60,
        ),
        CustomButton(
          Bname: "Cancel",
          onTap: () {
            Navigator.of(context).pop();
          },
          height: 40,
          width: 60,
        ),
      ],
    );
  }
}
