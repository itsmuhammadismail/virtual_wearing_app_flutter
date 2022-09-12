import 'package:flutter/material.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Login/login_screen.dart';
import 'package:virtual_wearing_app_flutter/resources/colors.dart';
import 'package:virtual_wearing_app_flutter/shared/layout/layout.dart';
import 'package:virtual_wearing_app_flutter/shared/routes/navigate.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/primary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/text_field.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/text_field_container.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/white_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String id = "profile_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 1,
      body: Body(),
    );
  }
}
