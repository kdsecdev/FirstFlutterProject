import 'package:flutter/material.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/components/my_textfield.dart';
import 'package:foodapp/services/auth/auth_service.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController = TextEditingController();
  //register method
  void register() async {
    //get auth service
    final _authService = AuthService();

    //check if passwords match -> create user
    if (passwordController.text == confirmpasswordController.text) {
      try {
        await _authService.signUpWithEmailPassword(
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

    //if passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Passwords don't match"),
            ),
      );
    }
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .surface,
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                  ),
                  //logo

                  const SizedBox(height: 25),

                  //message, app slogan
                  Text("Let's create an account for you",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary,
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
                  const SizedBox(height: 15),

                  //confirm password Textfield
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //signup button
                  MyButton(text: "Sign Up", onTap: () {
                    register();
                  },
                  ),

                  const SizedBox(height: 25),

                  //Already have an account? Login Here!
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .inversePrimary,),
                      ),

                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Login Here",
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .inversePrimary,
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

