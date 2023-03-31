import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.textKey, required this.func});
  final String? textKey;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {
              func.call();
            },
            child: Text(
              textKey?.tr ?? '',
              style: TextStyle(
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
