import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/repositories/product_repository.dart';
import 'package:virtual_wearing_app_flutter/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'package:virtual_wearing_app_flutter/features/user/data/repositories/user_repository.dart';
import 'package:virtual_wearing_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<UserCubit>(
      create: (context) => UserCubit(
        userRepository: context.read<UserRepository>(),
      ),
    ),
    BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(
        productRepository: context.read<ProductRepository>(),
      ),
    ),
  ];
}
