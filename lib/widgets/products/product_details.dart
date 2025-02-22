import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:provider/provider.dart'; // Özel ikon kütüphanesi.
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/widgets/products/heart_btn.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routName = "/ProductDetailScreen";
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productsProvider = Provider.of<ProductProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProId(productId!);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          title: const AppNameTextWidget(
            fontSize: 20,
          ),
        ),
        body: getCurrProduct == null
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.35,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(getCurrProduct.productTitle,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SubTitleTextWidget(
                                  label: "\$${getCurrProduct.productPrice}",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  HeartButtonWidget(
                                    productId: getCurrProduct.productId,
                                    bkgColor: Colors.pinkAccent.shade700,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: kBottomNavigationBarHeight - 10,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                          ),
                                          onPressed: () {
                                            if (cartProvider.isProdinCart(
                                                productId:
                                                    getCurrProduct.productId)) {
                                              return;
                                            }

                                            cartProvider.addProductCart(
                                                productId:
                                                    getCurrProduct.productId);
                                          },
                                          icon: Icon(cartProvider.isProdinCart(
                                                  productId:
                                                      getCurrProduct.productId)
                                              ? Icons.check
                                              : Icons
                                                  .add_shopping_cart_outlined),
                                          label: Text(cartProvider.isProdinCart(
                                                  productId:
                                                      getCurrProduct.productId)
                                              ? "Sepette"
                                              : "Sepete Ekle")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleTextWidget(label: "HAKKINDA"),
                                SubTitleTextWidget(
                                  label:
                                      " In ${getCurrProduct.productCategory}",
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SubTitleTextWidget(
                                label: getCurrProduct.productDescription)
                          ],
                        ))
                  ],
                ),
              ));
  }
}
