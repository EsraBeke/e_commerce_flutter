import 'dart:developer'; // Geliştirici araçları için kullanılan Dart kütüphanesi.

import 'package:e_commerce/widgets/subtitle_text.dart'; // Alt başlık metnini gösteren bileşen dosyası.
import 'package:e_commerce/widgets/title_text.dart'; // Başlık metnini gösteren bileşen dosyası.
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Görsel için animasyonlu yükleme efektleri sağlayan paket.
import 'package:flutter/cupertino.dart'; // iOS tasarım bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:iconly/iconly.dart'; // Özel ikon kütüphanesi.

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          log("to do add navigate"); // Ürüne tıklanınca yapılacak işlemi konsola yazdırır.
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl:
                    'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png', // Ürün resmi URL'si.
                height: size.height *
                    0.2, // Resmin yüksekliği (ekran yüksekliğinin %20'si).
                width: size.height *
                    0.2, // Resmin genişliği (ekran yüksekliğinin %20'si).
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 5,
                      child: TitleTextWidget(
                        label: "Title", // Ürün başlığı.
                        fontSize: 18, // Başlık metni boyutu.
                      )),
                  Flexible(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            IconlyLight.heart), // Kalp simgesi ikonu.
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                      flex: 1,
                      child: SubTitleTextWidget(
                        label: "150.00\$", // Ürün fiyatı.
                        fontWeight: FontWeight.w600, // Yazı kalınlığı.
                        color: Colors.red, // Yazı rengi.
                      )),
                  Flexible(
                      child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightBlue, // Buton arka plan rengi.
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {},
                      splashColor:
                          Colors.grey, // Butona tıklanınca yayılan renk.
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons
                            .add_shopping_cart_outlined), // Sepete ekle ikonu.
                      ),
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            )
          ],
        ),
      ),
    );
  }
}
