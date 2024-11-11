import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mitch_ecommerce/models/product_model.dart';
import 'package:mitch_ecommerce/view_models/user_cart_provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      margin: const EdgeInsets.only(right: 17),
      width: size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.imagePath,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '\$${product.price}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              Material(
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    ref.watch(userCartProvider);
                    return InkWell(
                      onTap: () {
                        ref
                            .read(userCartProvider.notifier)
                            .addOrRemoveFromCart(product);
                      },
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(12)),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          ref.read(userCartProvider.notifier).isInCart(product)
                              ? Icons.shopping_bag
                              : Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
