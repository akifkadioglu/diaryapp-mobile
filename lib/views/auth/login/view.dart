import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/component/app_text_field.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/views/auth/login/service.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(IKey.APP_NAME.tr),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                AppTextField(textKey: IKey.EMAIL),
                AppTextField(textKey: IKey.PASSWORD),
                AppButton(
                  func: login,
                  textKey: IKey.SEND,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
