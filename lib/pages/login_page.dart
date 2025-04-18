import 'package:flutter/material.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/components/my_textfield.dart';
import 'package:foodapp/pages/home_page.dart';
import 'package:foodapp/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
    final void Function()? onTap;

    const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
//get auth service
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }

    //display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(e.toString()),
            ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              //logo

              const SizedBox(height: 25),

              //message, app slogan
              Text("Food Delivery App",
              style:TextStyle(
                fontSize:16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
              const SizedBox(height: 25),

              //Email TextField
              MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false,
              ),

              const SizedBox(height: 15),

              //password Textfield
              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
              ),

              const SizedBox(height: 25),

              //signin button
              MyButton(text: "Sign In" ,
                onTap: login,
              ),

              const SizedBox(height: 25),

              //not a member Register Now!
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,),
                  ),

                const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register Now!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      )
    );
  }
}