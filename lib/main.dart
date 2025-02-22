import 'package:e_commerce/constans/theme_data.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/theme_provider.dart';
import 'package:e_commerce/providers/viewed_recently_providers.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:e_commerce/root_screen.dart';
import 'package:e_commerce/screens/auth/forgot_password.dart';
import 'package:e_commerce/screens/auth/login.dart';
import 'package:e_commerce/screens/auth/register.dart';
import 'package:e_commerce/screens/init_screen/viewed_recently.dart';
import 'package:e_commerce/screens/init_screen/wishList.dart';
import 'package:e_commerce/screens/search_screen.dart';
import 'package:e_commerce/widgets/order/order_screen.dart';
import 'package:e_commerce/widgets/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return WishlistProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ViewedProdProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eccomerce Ap ',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            //home: const LoginScreen(),
            home: const RootScreen(),
            routes: {
              ProductDetailScreen.routName: (context) =>
                  const ProductDetailScreen(),
              WishlistScreen.routName: (context) => const WishlistScreen(),
              ViewedRecentlyScreen.routName: (context) =>
                  const ViewedRecentlyScreen(),
              RegisterScreen.routName: (context) => const RegisterScreen(),
              OrderScreen.routName: (context) => const OrderScreen(),
              ForgotPassword.routName: (context) => const ForgotPassword(),
              SearchScreen.routName: (context) => const SearchScreen(),
            });
      }),
    );
  }
}
