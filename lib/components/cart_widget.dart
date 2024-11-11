import 'package:flutter/material.dart';
import 'package:mitch_ecommerce/models/product_model.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.userCart, required this.onDelete});
  final ProductModel userCart;
  final ValueChanged<ProductModel> onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
      child: ListTile(
        leading: Image.asset(userCart.imagePath),
        title: Text(userCart.name),
        subtitle: Text(userCart.price),
        trailing: IconButton(
            onPressed: () => onDelete(userCart),
            icon: const Icon(Icons.delete)),
      ),
    );
  }
}
