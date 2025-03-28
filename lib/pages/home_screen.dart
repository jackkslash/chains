import 'package:chains/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logOut() {
    // Add your log out logic here
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('home'),
        actions: [
          TextButton(
            onPressed: () {
              // Add your log out logic here
              logOut();
            },
            child: const Text(
              'logout',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(child: const Text('welcome')),
    );
  }
}
