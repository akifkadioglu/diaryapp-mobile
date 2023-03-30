import 'package:flutter/material.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: TextButton(
              child: Text("data"),
              onPressed: () {
                RouteManager.normalRoute(RouteName.LOGIN);
              },
            ),
          ),
        );
      },
    );
  }
}
