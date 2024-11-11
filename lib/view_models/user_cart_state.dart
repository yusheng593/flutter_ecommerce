import 'package:mitch_ecommerce/models/product_model.dart';

class UserCartState {
  final List<ProductModel> userCart;

  UserCartState({
    this.userCart = const [],
  });

  UserCartState copyWith({
    List<ProductModel>? userCart,
  }) {
    return UserCartState(
      userCart: userCart ?? this.userCart,
    );
  }
}
