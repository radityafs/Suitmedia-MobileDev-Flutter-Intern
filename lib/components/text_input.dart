import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, this.controller, this.hintText, this.type});

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please ${hintText!.toLowerCase()} cannot be empty';
        }
        return null;
      },
      keyboardType: type,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(right: 20, left: 16, top: 16, bottom: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
