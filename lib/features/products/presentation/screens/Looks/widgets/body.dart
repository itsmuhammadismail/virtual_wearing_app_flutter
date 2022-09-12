part of '../looks_screen.dart';

class Body extends StatelessWidget {
  final String image;

  const Body({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Image.network(
        'http://143.244.171.203:8080/static/images/result/$image',
        width: size.width * 0.8,
        height: size.width * 0.8,
      ),
      // child: Container(),
    );
  }
}
