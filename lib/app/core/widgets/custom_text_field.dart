import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.onChanged,
      this.cor = Colors.black12,
      this.iconSize = 17,
      this.fontSize = 14,
      this.buttonPrefix,
      this.buttonSufix,
      CustomIconButton? sufixIcon})
      : super(key: key);

  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final Color? cor;
  final double iconSize;
  final double fontSize;
  final Function(String)? onChanged;
  final VoidCallback? buttonPrefix;
  final VoidCallback? buttonSufix;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        showCursor: true,
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          prefixIcon: prefix ?? prefix,
          suffixIcon: suffix ?? suffix,
          fillColor: Colors.black12,
          hintStyle: TextStyle(
              color: const Color(0xFF666666),
              fontFamily: "Lexend",
              fontSize: fontSize),
          hintText: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
