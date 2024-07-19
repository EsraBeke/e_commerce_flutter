import 'dart:developer'; // Geliştirici araçları için kullanılan Dart kütüphanesi.

import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/viewed_recently_providers.dart';
import 'package:e_commerce/widgets/products/heart_btn.dart';
import 'package:e_commerce/widgets/products/product_details.dart';
import 'package:e_commerce/widgets/subtitle_text.dart'; // Alt başlık metnini gösteren bileşen dosyası.
import 'package:e_commerce/widgets/title_text.dart'; // Başlık metnini gösteren bileşen dosyası.
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Görsel için animasyonlu yükleme efektleri sağlayan paket.
import 'package:flutter/cupertino.dart'; // iOS tasarım bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart'; // Özel ikon kütüphanesi.

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrProduct = productsProvider.findByProId(widget.productId);
    return getCurrProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async {
                viewedProvider.addViewProd(productId: getCurrProduct.productId);
                await Navigator.pushNamed(context, ProductDetailScreen.routName,
                    arguments: getCurrProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
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
                              label:
                                  getCurrProduct.productTitle, // Ürün başlığı.
                              fontSize: 18, // Başlık metni boyutu.
                            )),
                        Flexible(
                          flex: 2,
                          child: HeartButtonWidget(
                              productId: getCurrProduct.productId),
                        )
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
                        Flexible(
                            flex: 1,
                            child: SubTitleTextWidget(
                              label:
                                  getCurrProduct.productPrice, // Ürün fiyatı.
                              fontWeight: FontWeight.w600, // Yazı kalınlığı.
                              color: Colors.red, // Yazı rengi.
                            )),
                        Flexible(
                            child: Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.lightBlue, // Buton arka plan rengi.
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0),
                            onTap: () {
                              if (cartProvider.isProdinCart(
                                  productId: getCurrProduct.productId)) {
                                return;
                              }
                              cartProvider.addProductCart(
                                  productId: getCurrProduct.productId);
                            },
                            splashColor:
                                Colors.grey, // Butona tıklanınca yayılan renk.
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(cartProvider.isProdinCart(
                                      productId: getCurrProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined),
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
