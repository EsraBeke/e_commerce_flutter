import 'dart:developer'; // Geliştirici araçları için kullanılan Dart kütüphanesi.

import 'package:e_commerce/constans/app_constans.dart'; // Uygulama sabitleri dosyası.
import 'package:e_commerce/widgets/products/product_details.dart';
import 'package:e_commerce/widgets/subtitle_text.dart'; // Alt başlık metnini gösteren bileşen dosyası.
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Görsel için animasyonlu yükleme efektleri sağlayan paket.
import 'package:flutter/cupertino.dart'; // iOS tasarım bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:iconly/iconly.dart'; // Özel ikon kütüphanesi.

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
              context,
              ProductDetailScreen
                  .routName); // Ürüne tıklanınca yapılacak işlemi konsola yazdırır.
        },
        child: SizedBox(
          width: size.width *
              0.45, // Widget'ın genişliği (ekran genişliğinin %45'i).
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FancyShimmerImage(
                    imageUrl: AppConstans.imageUrl, // Ürün resmi URL'si.
                    height: size.width *
                        0.24, // Resmin yüksekliği (ekran genişliğinin %24'ü).
                    width: size.width *
                        0.32, // Resmin genişliği (ekran genişliğinin %32'si).
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Title" * 15, // Ürün başlığı.
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                IconlyBold.heart)), // Kalp simgesi ikonu.
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                IconlyLight.bag)), // Çanta simgesi ikonu.
                      ],
                    ),
                  ),
                  const FittedBox(
                    child: SubTitleTextWidget(
                      label: "\$1000", // Ürün fiyatı.
                      fontWeight: FontWeight.w600, // Yazı kalınlığı.
                      color: Colors.red, // Yazı rengi.
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
