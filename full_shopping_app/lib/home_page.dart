
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

// The underscore (_) makes this State class private to this file.
// State classes should be private because they are implementation details
// of their corresponding widgets.

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print(" start Home");
  }

  @override
  void dispose() {
    print(" finish Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("welcome to Home Page"),
            ElevatedButton(
              onPressed: () {
                // Log out and navigate back to the login page.
                Database.isLoggedIn = false;
                context.go("/login");
              },
              child: const Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
