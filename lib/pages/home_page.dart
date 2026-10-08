import 'package:flutter/material.dart';
import 'package:week_4/widget_basic/avatar1.dart';
import 'package:week_4/widget_basic/button1.dart';
import 'package:week_4/widget_basic/column1.dart';
import 'package:week_4/widget_basic/container1.dart';
import 'package:week_4/widget_basic/expanded_widget.dart';
import 'package:week_4/widget_basic/gridview_widget.dart';
import 'package:week_4/widget_basic/icon1.dart';
import 'package:week_4/widget_basic/image1.dart';
import 'package:week_4/widget_basic/list_view_widget.dart';
import 'package:week_4/widget_basic/padding_widget.dart';
import 'package:week_4/widget_basic/row1.dart';
import 'package:week_4/widget_basic/sizedbox_widget.dart';
import 'package:week_4/widget_basic/stack_widget.dart';
import 'package:week_4/widget_basic/text1.dart';
import 'package:week_4/widget_basic/wrap_widget.dart';

// W4S3
import 'package:week_4/widget_basic/counter_widget.dart';
import 'package:week_4/widget_basic/textfield_widget.dart';
import 'package:week_4/widget_basic/form_widget.dart';
import 'package:week_4/widget_basic/dialog_widget.dart';
import 'package:week_4/widget_basic/product_card_demo.dart';
import 'package:week_4/pages/produk_list_page.dart';
import 'package:week_4/pages/main_navigation_page.dart';
import 'package:week_4/katalog/katalog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'title': '2.1 Container', 'widget': const Container1()},
      {'title': '2.2 Text', 'widget': const Text1()},
      {'title': '2.3 Button', 'widget': const Button1()},
      {'title': '2.4 Icon', 'widget': const Icon1()},
      {'title': '2.5 Image', 'widget': const Image1()},
      {'title': '2.6 CircleAvatar', 'widget': const Avatar1()},
      {'title': '2.7 Column', 'widget': const Column1()},
      {'title': '2.8 Row', 'widget': const Row1()},
      {'title': '2.9 ListView', 'widget': ListViewWidget()},
      {'title': '2.10 GridView', 'widget': const GridViewWidget()},
      {'title': '2.11 Stack', 'widget': const StackWidget()},
      {'title': '2.12 Padding', 'widget': const PaddingWidget()},
      {'title': '2.12 Expanded', 'widget': const ExpandedWidget()},
      {'title': '2.13 SizedBox', 'widget': const SizedBoxWidget()},
      {'title': '2.14 Wrap', 'widget': WrapWidget()},

      // W4S3
      {'title': '3.1 Counter', 'widget': const CounterWidget()},
      {'title': '3.2 TextField', 'widget': const TextFieldWidget()},
      {'title': '3.3 Form', 'widget': const FormWidget()},
      {'title': '3.4 Navigasi', 'widget': ProdukListPage()},
      {'title': '3.5 Dialog', 'widget': const DialogWidget()},
      {'title': '3.6 BottomNavigationBar', 'widget': const MainNavigationPage()},
      {'title': '3.7 ProductCard', 'widget': const ProductCardDemo()},
      {'title': 'Tugas W4S3: Katalog Produk', 'widget': const KatalogPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('PAM Minggu 4'),
      ),
      body: ListView.separated(
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            title: Text(item['title'] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item['widget'] as Widget,
                ),
              );
            },
          );
        },
      ),
    );
  }
}