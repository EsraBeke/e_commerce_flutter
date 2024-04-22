import 'dart:developer'; // Dart geliştirici araçları kütüphanesi.

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart'; // Dinamik yükseklikte grid görünümü sağlayan kütüphane.
import 'package:e_commerce/services/assets_manager.dart'; // Asset yöneticisi servisini içeren dosya.
import 'package:e_commerce/widgets/app_name_text.dart'; // Uygulama adını gösteren metin bileşeni.
import 'package:e_commerce/widgets/products/product_widget.dart'; // Ürün widget'ını içeren dosya.

import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController; // Arama metni kontrolcüsü.

  @override
  void initState() {
    searchTextController =
        TextEditingController(); // Metin kontrolcüsünü başlatır.
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose(); // Metin kontrolcüsünü temizler.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Odaklanma alanını kaldırır.
      },
      child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'images/bag/card.png'), // AppBar içindeki resim bileşeni.
            ),
            title: const AppNameTextWidget(
                fontSize: 20), // Uygulama adını gösteren metin bileşeni.
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller:
                      searchTextController, // Metin kontrolcüsünü atanmış metin alanı.
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search), // Arama simgesi.
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          FocusScope.of(context)
                              .unfocus(); // Odaklanma alanını kaldırır.
                          searchTextController
                              .clear(); // Metin alanını temizler.
                        });
                      },
                      child: const Icon(
                        Icons.clear, // Temizleme simgesi.
                        color: Colors.red, // Temizleme simgesinin rengi.
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // log("value of  text is $value"); // Değişen metni günlüğe kaydeder.
                  },
                  onSubmitted: (value) {
                    // log("${searchTextController}"); // Gönderilen metni günlüğe kaydeder.
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: DynamicHeightGridView(
                  mainAxisSpacing: 12, // Ana eksen aralığı.
                  crossAxisCount: 2, // Yatay eksen öğe sayısı.
                  crossAxisSpacing: 12, // Dikey eksen aralığı.
                  itemCount: 200, // Öğe sayısı.
                  builder: (context, index) {
                    return const ProductWidget(); // Ürün widget'ını döndürür.
                  },
                ))
              ],
            ),
          )),
    );
  }
}
