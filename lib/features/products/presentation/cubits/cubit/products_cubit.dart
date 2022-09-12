import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/models/product.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/repositories/product_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository productRepository;

  ProductsCubit({
    required this.productRepository,
  }) : super(ProductsState.initial());

  Future<void> get() async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      List<Product> products = await productRepository.getAll();
      emit(state.copyWith(
        status: ProductStatus.loaded,
        products: products,
      ));

      // print(products);

      // print("hello ${user.name}");
    } catch (err) {
      print("error");
      emit(state.copyWith(
        status: ProductStatus.error,
      ));
    }
  }

  Future<String> wear(String human, String dress) async {
    try {
      String image = await productRepository.wear(human, dress);
      print(image);
      return image;
    } catch (err) {
      print(err);
      return '';
    }
  }
}
