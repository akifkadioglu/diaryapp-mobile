import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldConstant {
  static InputDecoration decoration({String? textKey}) => InputDecoration(
        isDense: true,
        hintText: textKey?.tr,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
