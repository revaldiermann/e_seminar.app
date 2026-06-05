import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo, $username"),
      ),

      body: Center(
        child: Text(
          "Selamat datang $username",
        ),
      ),
    );
  }
}
