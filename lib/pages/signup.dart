import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: "Login Page".text.make(),
      ),
    );
  }
}
