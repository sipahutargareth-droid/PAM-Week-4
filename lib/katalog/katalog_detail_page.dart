import 'package:flutter/material.dart';
import 'package:week_4/models/produk.dart';

class KatalogDetailPage extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTambahKeranjang;

  const KatalogDetailPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.inventory_2, size: 120)),
            const SizedBox(height: 16),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Rp ${produk.harga}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  onTambahKeranjang();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${produk.nama} masuk keranjang')),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}