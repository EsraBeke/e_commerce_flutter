import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Alt sayfa kartının dış kutusunu oluşturur.
      decoration: BoxDecoration(
          color: Theme.of(context)
              .scaffoldBackgroundColor, // Temaya göre arka plan rengini alır.
          border: const Border(
            top: BorderSide(
                width: 1,
                color: Colors
                    .red), // Üst kenarlık rengini ve kalınlığını belirler.
          )),
      child: Padding(
          // Alt sayfa kartının içeriğini içeren dolgu bileşenini oluşturur.
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: kBottomNavigationBarHeight +
                10, // Alt kartın yüksekliğini belirler.
            child: Row(
              // Yatay bir sıralama oluşturur.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  // Esnek bir sütun oluşturur.
                  child: Column(
                    // Dikey bir sıralama oluşturur.
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      FittedBox(
                          child: TitleTextWidget(
                              label:
                                  "Toplam (6 Ürün/ 9 Öğe)")), // Başlık metnini gösteren widget.
                      SubTitleTextWidget(
                        // Alt başlık metnini gösteren widget.
                        label: " \$ 16.00", // Metnin içeriği.
                        color: Colors.red, // Metnin rengi.
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    // Yükseltilmiş bir düğme oluşturur.
                    onPressed: () {},
                    child:
                        const Text("Ödeme Yap")) // Düğmenin metnini belirler.
              ],
            ),
          )),
    );
  }
}
