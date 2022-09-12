import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/screens/Looks/looks_screen.dart';
import 'package:virtual_wearing_app_flutter/resources/colors.dart';
import 'package:virtual_wearing_app_flutter/resources/constants.dart';
import 'package:virtual_wearing_app_flutter/resources/typography.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/primary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/secondary_button.dart';
import 'package:virtual_wearing_app_flutter/shared/widgets/white_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class ProductScreen extends StatefulWidget {
  final String image, name, price, description;

  static String id = "product_screen";

  const ProductScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  File? image;
  bool isLoading = false;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;

    setState(() {
      isLoading = true;
    });

    String result =
        await context.read<ProductsCubit>().wear(image.path, widget.image);

    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LooksScreen(image: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Body(
                  image: widget.image,
                  name: widget.name,
                  price: widget.price,
                  description: widget.description),
            ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            Expanded(
              child: PrimaryButton(
                  child: const WhiteText('Try Now'),
                  onPressed: () => pickImage()),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SecondaryButton(
                  child: const Text('Add to Cart'), onPressed: () {}),
            ),
          ]),
        ),
      ),
    );
  }
}
