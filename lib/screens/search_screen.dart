import 'dart:developer'; // Dart geliştirici araçları kütüphanesi.
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart'; // Dinamik yükseklikte grid görünümü sağlayan kütüphane.
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/app_name_text.dart'; // Uygulama adını gösteren metin bileşeni.
import 'package:e_commerce/widgets/products/product_widget.dart'; // Ürün widget'ını içeren dosya.
import 'package:e_commerce/widgets/title_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.

class SearchScreen extends StatefulWidget {
  static const routName = "/SearchScreen";
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

  List<ProductModel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    'images/bag/card.png'), // AppBar içindeki resim bileşeni.
              ),
              title: TitleTextWidget(
                  label: passedCategory ??
                      "Search products") // Uygulama adını gösteren metin bileşeni.
              ),
          body: productList.isEmpty
              ? const Center(
                  child: TitleTextWidget(label: "Bu alan boş"),
                )
              : Padding(
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
                          prefixIcon:
                              const Icon(Icons.search), // Arama simgesi.
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // setState(() {
                              FocusScope.of(context)
                                  .unfocus(); // Odaklanma alanını kaldırır.
                              searchTextController
                                  .clear(); // Metin alanını temizler.
                              // });
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
                          setState(() {
                            productListSearch = productsProvider.searchQuery(
                                searchText: searchTextController.text,
                                passedList: productList);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      if (searchTextController.text.isNotEmpty &&
                          productListSearch.isEmpty) ...[
                        const Center(
                          child: TitleTextWidget(label: "No products found"),
                        )
                      ],
                      Expanded(
                          child: DynamicHeightGridView(
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        builder: (context, index) {
                          return ProductWidget(
                            productId: searchTextController.text.isNotEmpty
                                ? productListSearch[index].productId
                                : productList[index].productId,
                          );
                        },
                      ))
                    ],
                  ),
                )),
    );
  }
}
