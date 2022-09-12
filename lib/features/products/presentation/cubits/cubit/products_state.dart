part of 'products_cubit.dart';

enum ProductStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProductsState extends Equatable {
  final ProductStatus status;
  final List<Product> products;

  const ProductsState({
    required this.status,
    required this.products,
  });

  factory ProductsState.initial() => const ProductsState(
        status: ProductStatus.initial,
        products: [],
      );

  @override
  List<Object> get props => [status, products];

  @override
  bool get stringify => true;

  ProductsState copyWith({
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'products': [],
    };
  }

  factory ProductsState.fromMap(Map<String, dynamic> map) {
    return const ProductsState(
      status: ProductStatus.loaded,
      products: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsState.fromJson(String source) =>
      ProductsState.fromMap(json.decode(source) as Map<String, dynamic>);
}
