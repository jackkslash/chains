import 'package:chains/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});
  void register(BuildContext context) {
    // Implement register functionality here
    final auth = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Handle password mismatch
        auth.registerWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('error'),
                content: Text(e.toString()),
              ),
        );
      }
    } else {
      // Handle password mismatch
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('error'),
              content: const Text('passwords do not match'),
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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 206, 206),
              ),
              controller: emailController,
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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 206, 206),
              ),
              controller: passwordController,
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 230),
            child: Text("password again", style: TextStyle(fontSize: 16)),
          ),
          //password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
            child: TextField(
              cursorColor: Colors.black,
              cursorOpacityAnimates: false,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 206, 206),
              ),
              controller: confirmPasswordController,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle login action
              register(context);
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
                  'register',
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
              const Text('got account? '),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'login',
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
