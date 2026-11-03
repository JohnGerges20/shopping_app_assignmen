/*
PART 1: super.key

super.key passes the key to the parent StatefulWidget constructor.
The key is stored in the widget's key property.

The Key passed through super.key identifies the widget in the widget tree.
GlobalKey<FormState> is different because it gives us access to the FormState,
allowing us to validate the form.

PART 2: const

const widgets are created as compile-time constants.
Flutter can reuse the same widget instance during rebuilds
instead of creating a new instance, reducing unnecessary work.

PART 3: Private State

In Dart, underscore (_) makes a class, field, or method private
to its library (file).

State classes should be private to hide implementation details
and prevent other files from accessing them directly.
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      if (username == Database.username &&
          password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong info"),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print(" start Login");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    print(" finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter valid username";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "please enter valid password";
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _inputCheck,
                    child: const Text("go to home"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/signup");
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
PART 5.3: Navigation Experiments

Test 1: push() and pop()
When using context.push("/signup"), Signup opens above Login.
When using context.pop(), Signup closes and Login appears again.
Login is not disposed because it remains in the navigation stack.

Test 2: go() and pop()
When using context.go("/signup"), Login is replaced by Signup.
Login is disposed.
When using context.pop(), GoError occurs because there is nothing to pop.

Test 3: go() and go()
When using context.go("/signup") and then context.go("/login"),
Signup is replaced by a new Login page.
Navigation works successfully.

Test 4: push() and AppBar back arrow
When using push() to open Signup, pressing the AppBar back arrow
returns to Login because it pops the Signup route.

Difference between go() and push():
push() adds a new page to the navigation stack, keeping the previous
page underneath it. pop() removes the current page and returns to
the previous one.

go() navigates directly to a destination and replaces the current
route configuration. It does not work like push() in the navigation stack.
*/
