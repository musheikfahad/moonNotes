import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  // imit state to initiate the state

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

// dispose to avoid memory leak
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          decoration:
              const InputDecoration(hintText: "Enter email/phonenumber"),
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          controller: _password,
          decoration:
              const InputDecoration(hintText: "Enter a strong password"),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        ElevatedButton(
          onPressed: () async {
            // Example:

            //it will grab the latest text user enter inside the box
            final email = _email.text;
            final password = _password.text;
            try {
              final userCred =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              print(userCred);
            } on FirebaseAuthException catch (e) {
              // print("code is ====" + e.code);
              if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                // print("Invalid cred");
              } else {
                // print(e.code);
                // print("something in the way");
              }

              // print(e.runtimeType);
              // print(e);
            }
          },
          child: const Text("Login"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/register/", (route) => false);
          },
          child: const Text("Not registered yet?? , click here to register!!"),
        ),
      ]),
    );
  }
}
