import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/constants/text_field_constants.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
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
            foregroundColor: context.theme.colorScheme.onSurface,
            title: Text(IKey.LOGIN.tr),
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
                            ? const AppButton(textKey: IKey.LOGIN, func: login)
                            : const AppButtonLoading(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 3,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(IKey.DONT_HAVE_AN_ACCOUNT.tr),
                            ),
                            GestureDetector(
                              child: Text(
                                IKey.REGISTER.tr,
                                style: TextStyle(fontSize: 17),
                              ),
                              onTap: () {
                                RouteManager.normalRoute(RouteName.REGISTER);
                              },
                            ),
                          ],
                        ),
                      ],
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
