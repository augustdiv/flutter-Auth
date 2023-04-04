import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  TextEditingController controller;
  FieldWidget(this.hint, this.icon, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, style: BorderStyle.solid, color: Colors.blue),
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            prefixIconColor: Colors.blue[200],
            border: InputBorder.none,
            hintText: hint),
      ),
    );
  }
}
