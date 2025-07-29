import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.fontSize,
    required this.textColor,
    required this.fillColor,
    required this.borderColor,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final double fontSize;
  final Color textColor;
  final Color fillColor;
  final Color borderColor;
  final String? Function(String?)? validator; // <-- Added
  final void Function(String)? onChanged;     // <-- Added

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(color: widget.textColor, fontSize: widget.fontSize),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.hintText,
          labelStyle: TextStyle(color: widget.textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: widget.borderColor, width: 2),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: widget.textColor.withOpacity(0.6),
            ),
            onPressed: _toggleVisibility,
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
        cursorColor: widget.textColor,
        validator: widget.validator,     // <-- Added
        onChanged: widget.onChanged,     // <-- Added
      ),
    );
  }
}