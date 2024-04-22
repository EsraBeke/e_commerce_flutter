import 'dart:developer';

import 'package:e_commerce/widgets/subtitle_text.dart'; 
import 'package:flutter/material.dart'; 

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});
  //ürün adedi sayfası açılması için

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      log("index $index"); // Seçilen ürün adedini konsola yazdırır.
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SubTitleTextWidget(
                            label:
                                "${index + 1}"), // Ürün adedini gösteren metin bileşeni.
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
