import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart/bottom_checkout.dart';
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/screens/cart/empty_bag.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart'; // Material Design bileşenlerini içeren Flutter kütüphanesi.
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart'; // Flutter bileşenleri için temel kütüphane.

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
            imagePath: 'images/bag/card2.png',
            title: 'Sepetiniz Boş ',
            subtitle: 'Sepetiniz boş görünüyor',
            buttonText: 'Shop Now',
          ))
        : Scaffold(
            bottomSheet: CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bag/bag.png'),
              ),
              title: TitleTextWidget(
                  label: "Sepet (${cartProvider.getCartItems.length})"),
              actions: [
                IconButton(
                    onPressed: () {
                      cartProvider.clearLocalCart();
                    },
                    icon: const Icon(Icons.delete_forever_rounded,
                        color: Colors.red))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: cartProvider.getCartItems.length,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                            value: cartProvider.getCartItems.values
                                .toList()[index],
                            child: const CardWidget(),
                          );
                        }))
              ],
            ));
  }
}
