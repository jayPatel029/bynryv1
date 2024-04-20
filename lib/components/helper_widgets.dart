import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String Bname;
  final VoidCallback onTap;
  final double height;
  final double width;

  CustomButton(
      {super.key,
      required this.Bname,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Bname,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ))),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.controller,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: TextFormField(
        // validator: validator,
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
