import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/appColors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.hintText,
      this.inputFormatters,
      this.validator,
      this.onChange,
      this.textInputType,
      required this.icon})
      : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextInputType? textInputType;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        validator: validator,
        onChanged: onChange,
        style: TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.bg_Top_Gradient.withOpacity(.6),
          suffixIcon: icon,
          labelText: hintText,
          labelStyle: TextStyle(color: AppColors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppColors.bg_Top_Gradient.withOpacity(.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppColors.bg_Top_Gradient.withOpacity(.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: AppColors.bg_Top_Gradient.withOpacity(.4), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
        cursorColor: AppColors.black,
      ),
    );
  }
}
