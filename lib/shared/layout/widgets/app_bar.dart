import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/screens/Cart/cart_screen.dart';
import 'package:virtual_wearing_app_flutter/resources/constants.dart';
import 'package:virtual_wearing_app_flutter/shared/routes/navigate.dart';

class BuildAppBar extends StatelessWidget with PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        padding: kDefaultPadding,
        decoration: const BoxDecoration(),
        child: AppBar(
          title:
              SvgPicture.asset('assets/logos/virtual_wearing.svg', height: 27),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SvgPicture.asset('assets/icons/menu.svg'),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigate.to(context, CartScreen.id),
              child: SvgPicture.asset('assets/icons/bag.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
