import 'package:flutter/material.dart';
import 'package:virtual_wearing_app_flutter/resources/typography.dart';
import 'package:virtual_wearing_app_flutter/shared/layout/layout.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/primary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/white_text.dart';

part 'widgets/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String id = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Body(),
    );
  }
}
