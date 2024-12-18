import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.onChanged,
    this.onSaved,
    required this.hintText,
  });
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
