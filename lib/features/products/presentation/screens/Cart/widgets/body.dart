part of '../cart_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cart', style: kHeading2),
              SizedBox(
                width: 100,
                child: PrimaryButton(
                    child: const WhiteText('Delete'), onPressed: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
