import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/providers/viewed_recently_providers.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/screens/cart/empty_bag.dart';
import 'package:e_commerce/widgets/products/product_widget.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart'; // Flutter bileşenleri için temel kütüphane.

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);

    return viewedProdProvider.getViewedProds.isEmpty
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
                label: "Son Görüntülenenler",
              ),
            ),
            // Sepet boş ise gösterilecek ekran.
            body: EmptyBagWidget(
              // Boş sepet durumunu gösteren bileşen.
              imagePath: 'images/search.png', // Resim dosyası yolu.
              title: 'Son Görüntülenenler Boş ', // Başlık metni.
              subtitle:
                  'Son Görüntülenenler boş görünüyor', // Alt başlık metni.
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
                        "Son Görüntülenenler (${viewedProdProvider.getViewedProds.length})")),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              builder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductWidget(
                    productId: viewedProdProvider.getViewedProds.values
                        .toList()[index]
                        .productId,
                  ),
                );
              },
              itemCount: viewedProdProvider.getViewedProds.length,
              crossAxisCount: 2,
            ));
  }
}
