import 'dart:developer'; // Geliştirici araçları için kullanılan Dart kütüphanesi.

import 'package:e_commerce/constans/app_constans.dart'; // Uygulama sabitleri dosyası.
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/viewed_recently_providers.dart';
import 'package:e_commerce/widgets/products/heart_btn.dart';
import 'package:e_commerce/widgets/products/product_details.dart';
import 'package:e_commerce/widgets/subtitle_text.dart'; // Alt başlık metnini gösteren bileşen dosyası.
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Görsel için animasyonlu yükleme efektleri sağlayan paket.
import 'package:flutter/cupertino.dart'; // iOS tasarım bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart'; // Özel ikon kütüphanesi.

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedProvider.addViewProd(productId: productsModel.productId);
          await Navigator.pushNamed(context, ProductDetailScreen.routName,
              arguments: productsModel
                  .productId); // Ürüne tıklanınca yapılacak işlemi konsola yazdırır.
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.productImage,
                    height: size.width * 0.24,
                    width: size.width * 0.32,
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
                    productsModel.productTitle, // Ürün başlığı.
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: HeartButtonWidget(
                              productId: productsModel.productId),
                        ),
                        IconButton(
                          onPressed: () {
                            if (cartProvider.isProdinCart(
                                productId: productsModel.productId)) {
                              return;
                            }
                            cartProvider.addProductCart(
                                productId: productsModel.productId);
                          },
                          icon: Icon(cartProvider.isProdinCart(
                                  productId: productsModel.productId)
                              ? Icons.check
                              : Icons.add_shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: SubTitleTextWidget(
                      label: "\$ ${productsModel.productPrice}", // Ürün fiyatı.
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
