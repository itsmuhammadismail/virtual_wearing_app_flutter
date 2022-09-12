import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/repositories/product_repository.dart';
import 'package:virtual_wearing_app_flutter/features/user/data/repositories/user_repository.dart';

class RepositoryProviders {
  static List<RepositoryProvider> providers = [
    RepositoryProvider<UserRepository>(
      create: (context) => UserRepository(),
    ),
    RepositoryProvider<ProductRepository>(
      create: (context) => ProductRepository(),
    ),
  ];
}
