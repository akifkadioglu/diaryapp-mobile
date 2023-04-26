import 'package:flutter/material.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';

class TextFieldConstant {
  static InputDecoration decoration({IKey? textKey}) => InputDecoration(
        isDense: true,
        hintText: translate(textKey),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
