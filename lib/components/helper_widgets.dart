import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String Bname;
  final VoidCallback onTap;
  const CustomButton({
    super.key, required this.Bname, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40,
          width: 280,
          decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text( Bname ,style: TextStyle(color: Colors.white),),
          )
      ),
    );
  }
}


class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  // final String? Function(String?)? validator;

  const CustomTextfield({
    super.key,
    required this.hint, required this.controller,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,15,20,15),
      child: TextFormField(
        // validator: validator,
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
    super.key, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(onPressed: onPressed, icon: icon, ),
    );
  }
}
