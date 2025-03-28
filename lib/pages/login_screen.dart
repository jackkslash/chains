import 'package:chains/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  void login(BuildContext context) async {
    // Implement login functionality here
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
      // Navigate to the home screen or show success message
    } catch (e) {
      // Handle login error
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(e.toString()),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //logo
          const SizedBox(height: 100),
          Text('CHAIN', style: TextStyle(fontSize: 50)),

          //welocome text
          const Text(
            'a new way to message',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(right: 320),
            child: Text("email", style: TextStyle(fontSize: 16)),
          ),
          //email text field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
            child: TextField(
              cursorColor: Colors.black,
              cursorOpacityAnimates: false,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 206, 206),
              ),
              controller: _emailController,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 290),
            child: Text("password", style: TextStyle(fontSize: 16)),
          ),
          //password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
            child: TextField(
              cursorColor: Colors.black,
              cursorOpacityAnimates: false,
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 206, 206),
              ),
              controller: _passwordController,
            ),
          ),

          GestureDetector(
            onTap: () {
              // Handle login action
              login(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 208, 206, 206),
              ),
              child: const Center(
                child: Text(
                  'login',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          //register text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('new here? '),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'register here',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
