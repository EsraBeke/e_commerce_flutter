import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/constans/app_constans.dart';
import 'package:e_commerce/providers/theme_provider.dart';

import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/widgets/products/category_roundend_widget.dart';
import 'package:e_commerce/widgets/products/product_widget.dart';
import 'package:e_commerce/widgets/products/top_product.dart';
//import 'package:e_commerce/widgets/products/top_product.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
        context); // Tema sağlayıcısını kullanarak temayı alır.
    final ScrollController _scrollController =
        ScrollController(); // Bir scroll controller oluşturur.
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            // Sol taraftaki bileşenin kenar boşluklarını ayarlar.
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bag/card.png'),
          ),
          title: const AppNameTextWidget(
              fontSize: 20), // Uygulama adını gösteren metin bileşeni.
        ),
        body: Padding(
            // Ana gövde bileşenine iç içe bir Padding bileşeni ekler.
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                // Tek bir eksen boyunca kaydırılabilir bir alan sağlar.
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ClipRRect(
                      child: Swiper(
                    // Resimleri yatay bir kaydırıcıda göstermek için kullanılan bir widget.
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        // Resim dosyalarını yükler.
                        AppConstans.bannerImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstans.bannerImages.length,
                    autoplay: true,
                    pagination: SwiperPagination(
                        // Otomatik olarak resimleri kaydırırken sayfalama noktalarını ekler.
                        builder: DotSwiperPaginationBuilder(
                      activeColor:
                          Colors.red, // Aktif sayfalama noktasının rengi.
                      color: Colors.green, // Pasif sayfalama noktasının rengi.
                    )),
                  )),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const TitleTextWidget(
                    label: "Popüler ürünler"), // Başlık bileşeni.
                SizedBox(
                    height: size.height * 0.2,
                    child: ListView.builder(
                        // Yatay olarak en popüler ürünleri göstermek için bir ListView oluşturur.
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TopProductWidget(); // En popüler ürün bileşeni.
                        })),
                const TitleTextWidget(label: "Kategoriler"), // Başlık bileşeni.
                const SizedBox(
                  height: 15.0,
                ),
                GridView.count(
                    // Kategori kartlarını göstermek için bir GridView oluşturur.
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: List.generate(AppConstans.categoriesList.length,
                        (index) {
                      return CategoryRoundenWidget(
                        // Kategori yuvarlatılmış bileşeni.
                        image: AppConstans.categoriesList[index].image,
                        name: AppConstans.categoriesList[index].name,
                      );
                    }))
              ],
            ))));
  }
}
