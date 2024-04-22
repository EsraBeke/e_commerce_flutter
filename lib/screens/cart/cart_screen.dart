import 'package:e_commerce/screens/cart/bottom_checkout.dart';
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/screens/cart/empty_bag.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/widgets.dart'; // Flutter bileşenleri için temel kütüphane.

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            // Sepet boş ise gösterilecek ekran.
            body: EmptyBagWidget(
            // Boş sepet durumunu gösteren bileşen.
            imagePath: 'images/bag/card2.png', // Resim dosyası yolu.
            title: 'Sepetiniz Boş ', // Başlık metni.
            subtitle: 'Sepetiniz boş gibi', // Alt başlık metni.
            buttonText: 'Shop Now', // Buton metni.
          ))
        : Scaffold(
            // Sepet dolu ise gösterilecek ekran.
            bottomSheet:
                CartBottomSheetWidget(), // Sepet altında ödeme yapma bileşeni.
            appBar: AppBar(
              // AppBar bileşeni.
              leading: Padding(
                // Sol taraftaki bileşenin kenar boşluklarını ayarlar.
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    'images/bag/bag.png'), // AppBar içindeki resim bileşeni.
              ),
              title: const TitleTextWidget(
                  label: "Sepet (7)"), // Başlık metnini gösteren bileşen.
              actions: [
                IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.delete_forever_rounded, // Silme ikonu.
                            color: Colors.red)) // İkon rengi.
              ],
            ),
            body: ListView.builder(itemBuilder: (context, index) {
              return const CardWidget(); // Sepet öğelerini gösteren bileşen.
            }),
          );
  }
}
