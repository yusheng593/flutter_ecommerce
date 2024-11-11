import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mitch_ecommerce/components/cart_widget.dart';
import 'package:mitch_ecommerce/view_models/user_cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    '免費寄送',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    r'適用於 NT$4,500 以上的訂單。',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '購物車 🛒',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final userCartState = ref.watch(userCartProvider);
                  return userCartState.userCart.isEmpty
                      ? const Center(
                          child: Text(
                            '你的購物車中沒有任何商品。',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: userCartState.userCart.length,
                          itemBuilder: (context, index) {
                            return CartWidget(
                              userCart: userCartState.userCart[index],
                              onDelete: (product) {
                                ref
                                    .read(userCartProvider.notifier)
                                    .addOrRemoveFromCart(product);
                              },
                            );
                          });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
