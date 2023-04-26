import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/constants/text_field_constants.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';
import 'package:mobile/views/auth/register/service.dart';
import 'package:mobile/views/auth/register/view_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  RegisterViewController c = Get.put(RegisterViewController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: context.theme.colorScheme.onSurface,
            title: Text(translate(IKey.REGISTER)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: context.theme.canvasColor,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Card(
              color: context.theme.canvasColor,
              elevation: 0,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    TextField(
                      decoration: TextFieldConstant.decoration(textKey: IKey.EMAIL),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 255,
                      onChanged: (value) {
                        c.mail.value = value;
                      },
                    ),
                    TextField(
                      decoration: TextFieldConstant.decoration(textKey: IKey.NAME),
                      keyboardType: TextInputType.name,
                      maxLength: 255,
                      onChanged: (value) {
                        c.name.value = value;
                      },
                    ),
                    TextField(
                      decoration: TextFieldConstant.decoration(textKey: IKey.PASSWORD),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      maxLength: 255,
                      onChanged: (value) {
                        c.password.value = value;
                      },
                    ),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: !c.isLoading.value
                            ? const AppButton(textKey: IKey.REGISTER, func: register)
                            : const AppButtonLoading(),
                      ),
                    ),
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
