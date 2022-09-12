import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Login/login_screen.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/screens/Profile/profile_screen.dart';
import 'package:virtual_wearing_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildNavigationBar extends StatefulWidget {
  final int currentIndex;

  const BuildNavigationBar({super.key, required this.currentIndex});

  @override
  State<BuildNavigationBar> createState() => _BuildNavigationBarState();
}

class _BuildNavigationBarState extends State<BuildNavigationBar> {
  @override
  Widget build(BuildContext context) {
    List<String> pages = [
      HomeScreen.id,
      context.read<UserCubit>().state.user.token == ''
          ? LoginScreen.id
          : ProfileScreen.id,
    ];

    return NavigationBar(
        selectedIndex: widget.currentIndex,
        onDestinationSelected: (int newIndex) {
          Navigate.to(context, pages[newIndex]);
        },
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/account.svg'),
            label: 'Account',
          ),
        ]);
  }
}
