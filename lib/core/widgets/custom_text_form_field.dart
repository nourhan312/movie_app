import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    required this.isPassword,
    required this.hintText,
  });

  final String hintText;
  final bool isPassword;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormField();
}

class _CustomTexFormField extends State<CustomTexFormField> {
  bool isSecure = true;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isSecure : false,
      controller: controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
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
