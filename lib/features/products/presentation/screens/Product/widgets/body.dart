part of '../product_screen.dart';

class Body extends StatelessWidget {
  final String image, name, price, description;

  const Body({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.width,
                width: size.width,
                color: const Color(0xFFF0F2EF),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
              )
            ],
          ),
          Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  name,
                  style: kHeading3.copyWith(fontSize: 24),
                ),
                Text('Rs. $price',
                    style: kHeading3.copyWith(color: kPrimaryColor)),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: kBody1,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: kBody2.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
