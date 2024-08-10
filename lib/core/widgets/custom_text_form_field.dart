import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    this.isPassword,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.inputBorder,
    this.hintStyle,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction, this.keyboardType, // Default value
  });

  final String hintText;
  final bool? isPassword;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final TextInputType? keyboardType;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormField();
}

class _CustomTexFormField extends State<CustomTexFormField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType ,
      autovalidateMode: widget.autoValidateMode, // Use the new property
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: widget.isPassword ?? false ? isSecure : false,
      controller: widget.controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        border: widget.inputBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
            ),
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword ?? false
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                    child: Icon(
                      isSecure
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
