import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/screens/cart/empty_bag.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/widgets.dart'; // Flutter bileşenleri için temel kütüphane.

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";

  const WishlistScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
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
            // Sepet dolu ise gösterilecek ekran.
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
            body: ListView.builder(itemBuilder: (context, index) {
              return const CardWidget(); // Sepet öğelerini gösteren bileşen.
            }),
          );
  }
}
