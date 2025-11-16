import 'package:chess/authentication/login.dart';
import 'package:chess/game_board.dart';
import 'package:flutter/material.dart';
import 'api_services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void registerUser() async {
    final result = await ApiService.register(
      emailController.text,
      passwordController.text,
    );

    if (result["status"] == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result["data"] ?? "Register Success")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => GameBoard()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result["data"] ?? "Registration Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: Text("Login"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: registerUser,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
