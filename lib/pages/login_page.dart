import 'Package:flutter/material.dart';
import 'package:cm_flutter_bootstrap/components/my_button.dart';
import 'package:cm_flutter_bootstrap/components/my_text_field.dart';
import 'package:cm_flutter_bootstrap/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget
{
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async{
    final authService = Provider.of<AuthService>(context,listen: false);
    
    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),),);
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
         child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.message,
                  size:80,
                ),

                const SizedBox(height: 50),

                const Text(
                  "Welcome back! You've been missed!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25 ),

                //email Text field
                MyTextField(
                    controller: emailController,
                    hintText: "email",
                    obscureText: false
                ),

                const SizedBox(height: 10),

                //Password Text field
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(height: 25),
                
                MyButton(onTap: signIn, text: "Sign in"),

                const SizedBox(height: 50),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                     )
                    ),
                  ],
                ),

              ],
         ),
          )
       )
      )
    );
  }

}