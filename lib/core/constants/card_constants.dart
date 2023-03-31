import 'package:flutter/material.dart';

class CardConstant {
  RoundedRectangleBorder shape(Color  color) => RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        side: BorderSide(
          color: color,
          width: 0.5,
        ),
      );
}
