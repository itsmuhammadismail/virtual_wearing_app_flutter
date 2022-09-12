import 'package:flutter/material.dart';
import 'package:virtual_wearing_app_flutter/shared/layout/widgets/app_bar.dart';
import 'package:virtual_wearing_app_flutter/shared/layout/widgets/bottom_nav.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final int currentTab;

  const Layout({super.key, required this.body, this.currentTab = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      bottomNavigationBar: BuildNavigationBar(currentIndex: currentTab),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: body,
      ),
    );
  }
}
