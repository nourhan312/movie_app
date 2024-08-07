import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    this.isPassword,
    required this.hintText, required this.controller, this.suffixIcon, this.inputBorder, this.hintStyle,this.validator
  });

  final String hintText;
  final bool? isPassword;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator ;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormField();
}

class _CustomTexFormField extends State<CustomTexFormField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.white, // Change this to the desired color
      ),
      obscureText: widget.isPassword ?? false ? isSecure : false,
      controller: widget.controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: widget.inputBorder,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.suffixIcon ?? (widget.isPassword ?? false
            ? InkWell(
            onTap: () {
              isSecure = !isSecure;
              setState(() {});
            },
            child: Icon(isSecure == true
                ? Icons.remove_red_eye
                : Icons.visibility_off_outlined,color: Colors.grey,))
            : null),
      ),
    );
  }
}
