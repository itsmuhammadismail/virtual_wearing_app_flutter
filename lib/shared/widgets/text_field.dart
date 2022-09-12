import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool required, obscureText;
  final onChange;
  final TextInputType keyboardType;
  final int length;
  final bool autofocus;
  final bool textCenter;
  final Widget? icon;
  final bool disabled;
  final TextEditingController? controller;
  final String? topupNoStartsWith;

  const MyTextField({
    super.key,
    required this.hintText,
    this.required = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.length = 0,
    this.textCenter = false,
    this.autofocus = false,
    required this.onChange,
    this.icon,
    this.disabled = false,
    this.controller,
    this.topupNoStartsWith,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color(0xFF111113).withOpacity(0.2),
          width: 2,
        ));

    return TextFormField(
      readOnly: widget.disabled,
      controller: widget.controller,
      enabled: true,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText ? show : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      textAlign: widget.textCenter ? TextAlign.center : TextAlign.start,
      inputFormatters: widget.length != 0 && widget.topupNoStartsWith != null
          ? [
              LengthLimitingTextInputFormatter(widget.length),
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.allow(
                  RegExp(r'^' + widget.topupNoStartsWith! + '[0-9]*')),
            ]
          : null,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        prefixIconColor: const Color(0xFF111113).withOpacity(0.6),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: const Color(0xFF111113).withOpacity(0.6),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        suffixIcon: widget.obscureText
            ? (show
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xFFB4B4B4),
                    ),
                    onPressed: () => setState(() => show = false))
                : IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Color(0xFFB4B4B4),
                    ),
                    onPressed: () => setState(() => show = true)))
            : null,
      ),
      validator: widget.required
          ? (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            }
          : null,
    );
  }
}
