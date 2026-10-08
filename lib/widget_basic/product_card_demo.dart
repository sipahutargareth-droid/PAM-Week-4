import 'package:flutter/material.dart';
import 'package:week_4/widget_basic/product_card.dart';

class ProductCardDemo extends StatelessWidget {
  const ProductCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductCard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProductCard(
              nama: 'Kursi Minimalis',
              harga: 350000,
              onTap: () {
                print('Kursi Minimalis ditekan');
              },
            ),
            const SizedBox(height: 12),
            ProductCard(
              nama: 'Meja Kerja Kayu',
              harga: 750000,
              onTap: () {
                print('Meja Kerja Kayu ditekan');
              },
            ),
          ],
        ),
      ),
    );
  }
}