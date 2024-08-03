import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    this.isPassword,
    required this.hintText, required this.controller,
  });

  final String hintText;
  final bool? isPassword;
  final TextEditingController controller;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormField();
}

class _CustomTexFormField extends State<CustomTexFormField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ?? false ? isSecure : false,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
            onTap: () {
              isSecure = !isSecure;
              setState(() {});
            },
            child: Icon(isSecure == true
                ? Icons.remove_red_eye
                : Icons.visibility_off_outlined))
            : null,
      ),
    );
  }
}
