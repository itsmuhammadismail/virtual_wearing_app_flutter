import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/models/product.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Home/widgets/products_grid.dart';
import 'package:virtual_wearing_app_flutter/resources/colors.dart';
import 'package:virtual_wearing_app_flutter/resources/constants.dart';
import 'package:virtual_wearing_app_flutter/resources/typography.dart';
import 'package:virtual_wearing_app_flutter/shared/layout/layout.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/primary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/secondary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/text_field.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/white_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      currentTab: 0,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
