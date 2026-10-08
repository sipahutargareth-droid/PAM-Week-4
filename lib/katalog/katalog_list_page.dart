import 'package:flutter/material.dart';
import 'package:week_4/katalog/katalog_detail_page.dart';
import 'package:week_4/models/produk.dart';
import 'package:week_4/widget_basic/product_card.dart';

class KatalogListPage extends StatelessWidget {
  final List<Produk> produk;
  final VoidCallback onTambahKeranjang;
  final void Function(Produk) onHapus;

  const KatalogListPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    if (produk.isEmpty) {
      return const Center(child: Text('Belum ada produk'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: produk.length,
      itemBuilder: (context, index) {
        final item = produk[index];
        return ProductCard(
          nama: item.nama,
          harga: item.harga,
          onDelete: () => onHapus(item),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KatalogDetailPage(
                  produk: item,
                  onTambahKeranjang: onTambahKeranjang,
                ),
              ),
            );
          },
        );
      },
    );
  }
}