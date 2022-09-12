import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:virtual_wearing_app_flutter/shared/routes/navigate.dart';

part './widgets/body.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    void _onSuccess() {
      Navigate.next(context, HomeScreen.id);
    }

    void _navigateToNextScreen(VoidCallback onSuccess) async {
      await Future.delayed(const Duration(seconds: 2));
      onSuccess.call();
    }

    useEffect(() {
      _navigateToNextScreen(_onSuccess);
      return null;
    }, []);

    return const Scaffold(
      body: Body(),
    );
  }
}
