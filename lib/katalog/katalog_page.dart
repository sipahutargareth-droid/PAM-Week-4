import 'package:flutter/material.dart';
import 'package:week_4/katalog/form_tambah_page.dart';
import 'package:week_4/katalog/katalog_list_page.dart';
import 'package:week_4/models/produk.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  int _tab = 0;
  int _keranjang = 0;

  final List<Produk> _produk = [
    const Produk(nama: 'Kursi Minimalis', harga: 350000),
    const Produk(nama: 'Meja Kerja Kayu', harga: 750000),
    const Produk(nama: 'Lampu Meja LED', harga: 120000),
    const Produk(nama: 'Rak Buku', harga: 450000),
    const Produk(nama: 'Sofa Kecil', harga: 1500000),
  ];

  void _tambahKeranjang() => setState(() => _keranjang++);

  Future<void> _hapus(Produk p) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('${p.nama} akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (ok == true) {
      setState(() => _produk.remove(p));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${p.nama} telah dihapus')),
      );
    }
  }

  Future<void> _tambahProduk() async {
    final baru = await Navigator.push<Produk>(
      context,
      MaterialPageRoute(builder: (context) => const FormTambahPage()),
    );
    if (baru != null) {
      setState(() => _produk.add(baru));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${baru.nama} berhasil ditambahkan')),
      );
    }
  }

  Widget _ikonKeranjang() {
    return Stack(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        if (_keranjang > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$_keranjang',
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final halaman = [
      KatalogListPage(
        produk: _produk,
        onTambahKeranjang: _tambahKeranjang,
        onHapus: _hapus,
      ),
      const Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 20))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tab == 0 ? 'Katalog Produk' : 'Profil'),
        actions: [_ikonKeranjang()],
      ),
      body: halaman[_tab],
      floatingActionButton: _tab == 0
          ? FloatingActionButton(
              onPressed: _tambahProduk,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}