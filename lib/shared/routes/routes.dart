import 'package:flutter/material.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/screens/Cart/cart_screen.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/screens/Looks/looks_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Login/login_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Profile/profile_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Signup/signup_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Splash/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    ProfileScreen.id: (context) => const ProfileScreen(),
    CartScreen.id: (context) => const CartScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    SignupScreen.id: (context) => const SignupScreen(),
    // LooksScreen.id: (context) => const LooksScreen(),
    // ProductScreen.id: (context) => const ProductScreen(),
  };
}
