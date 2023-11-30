import 'package:flutter/material.dart';
import 'package:frontend_app/utils/extension.dart';

class CustomAppTextFormField extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final TextInputType textInputType;
  final bool outlineBorderRequired;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomAppTextFormField({
    super.key,
    required this.hintText,
    required this.isObscureText,
    required this.textInputType,
    required this.outlineBorderRequired,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<CustomAppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<CustomAppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0.hp),
      child: TextFormField(
        obscureText: widget.isObscureText,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          focusedBorder: widget.outlineBorderRequired
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
          enabledBorder: widget.outlineBorderRequired
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
          prefixIcon: Icon(widget.prefixIcon, color: Colors.black),
          suffixIcon: Icon(widget.suffixIcon, color: Colors.black),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
        ),
        validator: widget.validator,
      ),
    );
  }
}
