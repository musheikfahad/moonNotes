import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nilanotes/constants/routes.dart';
// import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Register"),
      ),
      body: Column(
        children: [
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
              try {
                // Example:

                //it will grab the latest text user enter inside the box
                final email = _email.text;
                final password = _password.text;

                final userCred =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                print(userCred);

                // devtools.log(userCred.toString());
              } on FirebaseAuthException catch (e) {
                if (e.code == "weak-password") {
                  print("weak Password");
                } else if (e.code == "email-already-in-use") {
                  print("Something in the way");
                } else {
                  print(e.code);
                  print("some other error");
                }
              }
            },
            child: const Text("Register"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Login if already registered!!"))
        ],
      ),
    );
  }
}
