import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/constants/card_constants.dart';
import 'package:mobile/core/constants/text_field_constants.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/views/auth/login/service.dart';
import 'package:mobile/views/auth/login/view_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  LoginViewController c = Get.put(LoginViewController());

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
            child: Card(
              color: context.theme.canvasColor,
              elevation: 0,
              margin: const EdgeInsets.all(10),
              shape: CardConstant().shape(context.theme.disabledColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: TextFieldConstant.decoration(textKey: IKey.EMAIL),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        c.mail.value = value;
                      },
                    ),
                    TextField(
                      decoration: TextFieldConstant.decoration(textKey: IKey.PASSWORD),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (value) {
                        c.password.value = value;
                      },
                    ),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: !c.isLoading.value
                            ? const AppButton(textKey: IKey.SEND, func: login)
                            : const AppButtonLoading(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
