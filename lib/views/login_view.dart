import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nilanotes/constants/routes.dart';
import 'package:nilanotes/utilities/show_error_dialog.dart';
// import 'dart:developer' as devtools show log;

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
              // final userCred =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              // print(userCred);
              // devtools.log(userCred.toString());

              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                notesRoute,
                (route) => false,
              );
            } on FirebaseAuthException catch (e) {
              // print("code is ====" + e.code);
              if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                // ignore: use_build_context_synchronously
                await showErrorDialog(
                  context,
                  "Invalid login credentials",
                );
              } else if (e.code == "invalid-email") {
                // ignore: use_build_context_synchronously
                await showErrorDialog(
                  context,
                  "Invalid email id",
                );
              } else {
                // ignore: use_build_context_synchronously
                await showErrorDialog(
                  context,
                  "Error: ${e.code}",
                );
              }
            } catch (e) {
              // ignore: use_build_context_synchronously
              await showErrorDialog(
                context,
                e.toString(),
              );
            }
          },
          child: const Text("Login"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
          },
          child: const Text("Not registered yet?? , click here to register!!"),
        ),
      ]),
    );
  }
}
