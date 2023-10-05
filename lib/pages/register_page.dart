import 'package:cm_flutter_bootstrap/components/my_button.dart';
import 'package:cm_flutter_bootstrap/components/my_text_field.dart';
import 'package:cm_flutter_bootstrap/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void SignUp() async{
     if(passwordController.text != confirmPasswordController.text)
       {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text("Passwords do not Match.")),
         );
         return;
       }
     final authService = Provider.of<AuthService>(context, listen: false);

     try{
       await authService.signUpWithEmailandPassword(
           emailController.text,
           passwordController.text);
     } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);
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
                      Icon(
                        Icons.message,
                        size:80,
                      ),

                      const SizedBox(height: 50),

                      const Text(
                        "Let's get you Started!",
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

                      const SizedBox(height: 10),

                      MyTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: true),
                      const SizedBox(height: 25),

                      MyButton(onTap: SignUp, text: "Sign Up"),

                      const SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already a member?'),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Log in',
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