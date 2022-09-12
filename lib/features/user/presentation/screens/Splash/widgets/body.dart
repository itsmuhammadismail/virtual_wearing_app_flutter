part of '../splash_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/logos/virtual_wearing.svg'),
    );
  }
}
