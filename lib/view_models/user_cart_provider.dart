import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mitch_ecommerce/models/product_model.dart';
import 'package:mitch_ecommerce/view_models/user_cart_state.dart';

final userCartProvider = StateNotifierProvider<UserCartProvider, UserCartState>(
    (_) => UserCartProvider());

class UserCartProvider extends StateNotifier<UserCartState> {
  UserCartProvider() : super(UserCartState());

  bool isInCart(ProductModel product) {
    return state.userCart.any((item) => item.id == product.id);
  }

  void addOrRemoveFromCart(ProductModel product) {
    bool wasInCart = isInCart(product);
    final List<ProductModel> updatedUserCart = wasInCart
        ? state.userCart
            .where(
              (element) => element.id != product.id,
            )
            .toList()
        : [...state.userCart, product];

    state = state.copyWith(
      userCart: updatedUserCart.reversed.toList(),
    );
  }
}
