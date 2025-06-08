import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class Ecomtextfield extends StatefulWidget {
  const Ecomtextfield({
    super.key,
    required this.onChanged,
    this.formInputModel,
    required this.labelText,
    this.errorText,
    this.errorFunction,
    this.isPassword,
    this.icon,
  });

  final Function(String) onChanged;
  final FormzInput? formInputModel;
  final String labelText;
  final String? errorText;
  final Function? errorFunction;
  final bool? isPassword;
  final Widget? icon;

  @override
  State<Ecomtextfield> createState() => _EcomtextfieldState();
}

class _EcomtextfieldState extends State<Ecomtextfield> {
  bool seenPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: (value) => widget.onChanged(value),
        obscureText: (widget.isPassword ?? false) && !seenPassword,
        decoration: InputDecoration(
          prefixIcon: SizedBox(width: 40, child: Center(child: widget.icon)),
          suffixIcon:
              widget.isPassword != null
                  ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        seenPassword = !seenPassword;
                      });
                    },
                    icon: FaIcon(
                      seenPassword
                          ? FontAwesomeIcons.solidEye
                          : FontAwesomeIcons.solidEyeSlash,
                      color: Colors.grey[500],
                    ),
                  )
                  : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? Colors.grey,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(color: Colors.red),
          hintText: widget.labelText,
          errorText:
              widget.errorFunction != null
                  ? widget.errorFunction!(widget.formInputModel)
                  : widget.formInputModel != null &&
                      widget.formInputModel!.isNotValid &&
                      !widget.formInputModel!.isPure
                  ? widget.errorText
                  : null,
        ),
      ),
    );
  }
}
