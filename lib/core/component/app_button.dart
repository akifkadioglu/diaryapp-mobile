import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.textKey, required this.func});
  final IKey? textKey;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              func.call();
            },
            child: Text(
              translate(textKey),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppButtonLoading extends StatelessWidget {
  const AppButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: FilledButton(
            onPressed: null,
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          ),
        ),
      ],
    );
  }
}
