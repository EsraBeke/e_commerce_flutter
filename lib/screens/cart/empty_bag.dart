import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Kaydırma fiziklerini ayarlar.
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              imagePath, // Resim dosyası yolu.
              width: double.infinity, // Sınırsız genişlik.
              height: size.height *
                  0.35, // Ekran yüksekliğinin %35'i kadar yükseklik.
            ),
            const SizedBox(
              height: 20,
            ),
            const TitleTextWidget(
                label: "Whooops",
                fontSize: 40,
                color: Colors.red), // Başlık metni.
            const SizedBox(
              height: 20,
            ),
            SubTitleTextWidget(
              label: title, // Alt başlık metni.
              fontWeight: FontWeight.w600, // Yazı kalınlığı.
              fontSize: 25, // Yazı boyutu.
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubTitleTextWidget(
                  label: subtitle, // Alt başlık metni.
                  fontWeight: FontWeight.w400, // Yazı kalınlığı.
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0, // Yükselti (gölgelendirme) miktarı.
                  backgroundColor: Colors.red, // Arka plan rengi.
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Yastıklama.
                ),
                onPressed: () {}, // Butona tıklama olayı.
                child: Text(buttonText)) // Buton metni.
          ],
        ));
  }
}
