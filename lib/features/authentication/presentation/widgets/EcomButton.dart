import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EcomButton extends StatelessWidget {
  const EcomButton({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    this.borderColor,
    required this.onPressed,
  });

  final Color textColor;
  final Color backgroundColor;
  final String text;
  final Color? borderColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => onPressed(),
            child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
