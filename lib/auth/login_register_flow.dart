import 'package:chains/pages/login_screen.dart';
import 'package:chains/pages/register_screen.dart';
import 'package:flutter/material.dart';

class LoginRegisterFlow extends StatefulWidget {
  const LoginRegisterFlow({super.key});

  @override
  State<LoginRegisterFlow> createState() => _AuthState();
}

class _AuthState extends State<LoginRegisterFlow> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(
        onTap: () {
          toggleView();
        },
      );
    } else {
      return RegisterScreen(
        onTap: () {
          toggleView();
        },
      );
    }
  }
}
