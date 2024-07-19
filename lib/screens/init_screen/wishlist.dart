import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/screens/cart/empty_bag.dart';
import 'package:e_commerce/widgets/products/product_widget.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart'; // Flutter bileşenleri için temel kütüphane.

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";

  const WishlistScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishlistProvider>(context);

    return wishListProvider.getWishLists.isEmpty
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  )),
              title: const TitleTextWidget(
                label: "Favoriler",
              ),
            ),
            // Sepet boş ise gösterilecek ekran.
            body: EmptyBagWidget(
              // Boş sepet durumunu gösteren bileşen.
              imagePath: 'images/bag/7.png', // Resim dosyası yolu.
              title: 'Sepetiniz Boş ', // Başlık metni.
              subtitle: 'Sepetiniz boş gibi', // Alt başlık metni.
              buttonText: 'Shop Now', // Buton metni.
            ))
        : Scaffold(
            appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                title: TitleTextWidget(
                    label:
                        "Favoriler (${wishListProvider.getWishLists.length})")),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              builder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductWidget(
                    productId: wishListProvider.getWishLists.values
                        .toList()[index]
                        .productId,
                  ),
                );
              },
              itemCount: wishListProvider.getWishLists.length,
              crossAxisCount: 2,
            ));
  }
}
