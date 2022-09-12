import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Signup/signup_screen.dart';
import 'package:virtual_wearing_app_flutter/resources/typography.dart';
import 'package:virtual_wearing_app_flutter/shared/routes/navigate.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/alert.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/primary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/secondary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/text_field.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/text_field_container.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/white_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const Body(),
        ),
      ),
    );
  }
}
