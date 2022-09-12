import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/models/product.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/screens/Product/product_screen.dart';
import 'package:virtual_wearing_app_flutter/resources/colors.dart';
import 'package:virtual_wearing_app_flutter/resources/typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGrid extends HookWidget {
  final String category, search;

  const ProductsGrid({required this.category, required this.search});

  @override
  Widget build(BuildContext context) {
    final productState = useState([]);
    useEffect(() {
      List<Product> newProducts = context.read<ProductsCubit>().state.products;
      List<Product> filteredProducts = newProducts
          .where((element) =>
              element.category == category &&
              element.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
      print("hwllo");
      productState.value = filteredProducts;

      return null;
    }, [context.watch<ProductsCubit>().state.products, category, search]);

    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 4,
      ),
      itemCount: productState.value.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(
                  image: productState.value[index].image,
                  name: productState.value[index].name,
                  price: productState.value[index].price,
                  description: productState.value[index].description,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF0F2EF),
                    ),
                    child: Image.asset(
                      productState.value[index].image,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  productState.value[index].name,
                  style: kBody2,
                ),
                Text(
                  "Rs. ${productState.value[index].price}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
