
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'products_page.dart';
import 'signup_page.dart';
import 'test.dart';

final router = GoRouter(
  initialLocation: "/login",

  redirect: (context, state) {
    var path = state.matchedLocation;

    // Protect the Home page and all its nested routes.
    // If the user is not logged in, redirect to Login.
    if (path.startsWith("/home") && !Database.isLoggedIn) {
      return "/login";
    }

    return null;
  },

  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),

    // Signup is a top-level route, not nested inside Home.
    GoRoute(
      path: "/signup",
      builder: (context, state) => const SignupPage(),
    ),

    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "products",
          builder: (context, state) => const ProductsPage(),
        ),
      ],
    ),
  ],
);
