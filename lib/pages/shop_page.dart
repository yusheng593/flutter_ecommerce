import 'package:flutter/material.dart';
import 'package:mitch_ecommerce/components/product_widget.dart';
import 'package:mitch_ecommerce/models/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Text(
              '熱門精選 🔥',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Product().product.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    product: Product().product[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
