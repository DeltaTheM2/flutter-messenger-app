import 'package:cm_flutter_bootstrap/pages/login_page.dart';
import 'package:cm_flutter_bootstrap/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              return const HomePage();
            }
          else
            {
              return const LoginOrRegister();
            }
        },
      )
    );
  }
}