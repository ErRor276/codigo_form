import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.obscureText = false,
    this.initialValue,
    this.validator,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  final String? initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    const borderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFE9ECEF),
      ),
    );

    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      initialValue: initialValue,
      textInputAction: TextInputAction.next,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(fontSize: 16),
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 62,
          maxWidth: 62,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 62,
          maxWidth: 62,
        ),
        enabledBorder: borderStyle,
        errorBorder: borderStyle.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: borderStyle,
        focusedErrorBorder: borderStyle,
      ),
      readOnly: readOnly,
    );
  }
}
