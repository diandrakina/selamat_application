import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final bool readOnly;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    this.readOnly = false,
    required this.hintText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textEditingController,
      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w400), 
      decoration: InputDecoration(
          hintStyle: TextStyle(color: AppColors.white, fontWeight: FontWeight.w400),
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          // filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isPass,
      readOnly: readOnly,
    );
  }
}
