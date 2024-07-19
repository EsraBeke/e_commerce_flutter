import 'package:e_commerce/screens/init_screen/viewed_recently.dart';
import 'package:e_commerce/screens/init_screen/wishList.dart';
import 'package:e_commerce/services/assets_manager.dart';
import 'package:e_commerce/services/myapp_functions.dart';
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/widgets/order/order_screen.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
        context); // Tema sağlayıcısını kullanarak temayı alır.

    return Scaffold(
      // Scaffold oluşturur.
      appBar: AppBar(
        // AppBar bileşenini oluşturur.
        leading: Padding(
          // Sol taraftaki bileşenin kenar boşluklarını ayarlar.
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              'images/bag/card.png'), // AppBar içindeki resim bileşeni.
        ),
        title: const AppNameTextWidget(
            fontSize: 20), // Uygulama adını gösteren metin bileşeni.
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kullanıcı Giriş Uyarısı
          const Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleTextWidget(
                    label: "label"), // Başlık metnini gösteren widget.
              )),
          Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .cardColor, // Temaya göre kart rengini alır.
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background, // Temaya göre arka plan rengini alır.
                              width: 3),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'images/categories/computer.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TitleTextWidget(
                            label:
                                "Esra Beke"), // Başlık metnini gösteren widget.
                        SizedBox(
                          height: 6,
                        ),
                        SubTitleTextWidget(
                            label:
                                "Coding --- Esra Beke") // Alt başlık metnini gösteren widget.
                      ],
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleTextWidget(
                    label: "Information"), // Başlık metnini gösteren widget.
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                    imagePath: 'images/bag/2.png',
                    text: "Tüm Siparişler",
                    function: () {
                      Navigator.pushNamed(context, OrderScreen.routName);
                    }),
                CustomListTile(
                    imagePath: 'images/bag/1.png',
                    text: "Favoriler",
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routName);
                    }),
                CustomListTile(
                    imagePath: 'images/profile/clock.png',
                    text: "Son Görüntülenenler",
                    function: () {
                      Navigator.pushNamed(
                          context, ViewedRecentlyScreen.routName);
                    }),
                CustomListTile(
                    imagePath: 'images/profile/location.png',
                    text: "Adres",
                    function: () {}),
                const Divider(
                  thickness: 1,
                ),
                CustomListTile(
                    imagePath: 'images/profile/privacy.png',
                    text: "Ayarlar",
                    function: () {}),
                const SizedBox(height: 10),
                SwitchListTile(
                    title: Text(themeProvider.getIsDarkTheme
                        ? "Dark Mode"
                        : "Light Mode"),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themeValue: value);
                    })
              ],
            ),
          ),

          Center(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                onPressed: () async {
                  await MyAppFunctions.showErrorOrWaningDialog(
                      context: context,
                      subtitle: "Emin misin ? ",
                      fct: () {},
                      isError: false);
                },
                icon: const Icon(Icons.login),
                label: const Text("Login")),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubTitleTextWidget(
          label: text), // Alt başlık metnini gösteren widget.
      leading: Image.asset(
        imagePath, // Resim dosyası yolu.
        height: 34,
      ),
      trailing:
          const Icon(CupertinoIcons.chevron_right), // Cupertino ikon bileşeni.
    );
  }
}
