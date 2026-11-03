
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() {
    return _ProductsPageState();
  }
}

// The underscore (_) makes this State class private to this file.
// State classes are implementation details of their widgets.

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    print(" start Products");
  }

  @override
  void dispose() {
    print(" finish Products");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("welcome to Products Page"),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
