import 'package:flutter/material.dart';
import 'package:foodapp/pages/login_page.dart';
import 'package:foodapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //Initially, show login page
  bool showLoginPage = true;

  //toggle between login and register pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if (showLoginPage) {
     return LoginPage(onTap: togglePages);
   }
   return RegisterPage(onTap: togglePages);
   }
  }

