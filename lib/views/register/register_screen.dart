import 'package:flutter/material.dart';
import 'package:golepps/views/register/components/register.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(),
    );
  }
}