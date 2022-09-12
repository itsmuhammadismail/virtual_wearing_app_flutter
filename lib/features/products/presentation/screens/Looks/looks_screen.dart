import 'package:flutter/material.dart';

part 'widgets/body.dart';

class LooksScreen extends StatelessWidget {
  final String image;

  static String id = "looks_screen";

  const LooksScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('It Looks')),
      body: Body(image: image),
      // body: Container(),
      // bottomNavigationBar: Material(
      //   elevation: 20,
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Expanded(
      //       child: PrimaryButton(
      //         child: const WhiteText('Add to Cart'),
      //         onPressed: () {},
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
