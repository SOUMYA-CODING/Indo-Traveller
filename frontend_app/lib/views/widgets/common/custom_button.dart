import 'package:flutter/material.dart';
import 'package:frontend_app/config/color.dart';
import 'package:frontend_app/constants/extension.dart';

class CustomAppButton extends StatefulWidget {
  final Widget content;
  final VoidCallback onPressed;
  final bool outlineBorderRequired;
  final Color backgroundColor;

  const CustomAppButton({
    super.key,
    required this.content,
    required this.onPressed,
    required this.outlineBorderRequired,
    required this.backgroundColor,
  });

  @override
  State<CustomAppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<CustomAppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.symmetric(vertical: 2.0.hp),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
          shape: widget.outlineBorderRequired
              ? MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: widget.backgroundColor),
                  ),
                )
              : MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                ),
        ),
        onPressed: widget.onPressed,
        child: widget.content,
      ),
    );
  }
}
