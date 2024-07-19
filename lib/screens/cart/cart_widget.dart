import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/cart/quantity_btm_sheet.dart';
import 'package:e_commerce/widgets/products/heart_btn.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Gelişmiş shimmer efektli resim bileşeni.
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart'; // Iconly ikon setini içeren kütüphane.

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    final cartModel = Provider.of<CartModel>(context);
    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrProduct = productsProvider.findByProId(cartModel.productId);
    return getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: getCurrProduct.productImage,
                        height: size.height * 0.2, // Resim yüksekliği.
                        width: size.height * 0.2, // Resim genişliği.
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                child: TitleTextWidget(
                                  label: getCurrProduct
                                      .productTitle, // Başlık metni.
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartProvider.removeOneItem(
                                            productId:
                                                getCurrProduct.productId);
                                      },
                                      icon: const Icon(Icons.clear,
                                          color: Colors.red)),

                                  HeartButtonWidget(
                                    productId: getCurrProduct.productId,
                                  ),
                                  // Kalp ikonu.
                                  //kalpli buton
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SubTitleTextWidget(
                                  label: "\$ ${getCurrProduct.productPrice}",
                                  color: Colors.blue),
                              const Spacer(),
                              OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    )),
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheetWidget(
                                          cartModel: cartModel);
                                    },
                                  );
                                },
                                icon: const Icon(IconlyLight.arrow_down_2),
                                label: Text(
                                    "QTY : ${cartModel.quantity}"), // Buton metni ve adet bilgisi.
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
