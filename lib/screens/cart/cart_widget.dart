import 'package:e_commerce/screens/cart/quantity_btm_sheet.dart';
import 'package:e_commerce/widgets/products/heart_btn.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart'; // Gelişmiş shimmer efektli resim bileşeni.
import 'package:iconly/iconly.dart'; // Iconly ikon setini içeren kütüphane.

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Ekran boyutunu alır.
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
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
                            label: "Title" * 15, // Başlık metni.
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.clear, color: Colors.red)),

                            HeartButtonWidget(),
                            // Kalp ikonu.
                            //kalpli buton
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SubTitleTextWidget(
                            label: "16.00\$",
                            color: Colors.blue), // Alt başlık metni.
                        const Spacer(),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Theme.of(context)
                                  .scaffoldBackgroundColor, // Arka plan rengi.
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )),
                              context: context,
                              builder: (context) {
                                return const QuantityBottomSheetWidget(); // Adet seçim alt sayfası bileşeni.
                              },
                            );
                          },
                          icon: const Icon(
                              IconlyLight.arrow_down_2), // Aşağı ok ikonu.
                          label: const Text(
                              "QTY : 6"), // Buton metni ve adet bilgisi.
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1), // Buton kenarlık kalınlığı.
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0))), // Butonun şekli.
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
