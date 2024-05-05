import 'package:flutter/material.dart';
import 'package:aliza_ecommerce/model/Product.dart';
import 'package:aliza_ecommerce/components/product_card.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: demoProducts.length,
              itemBuilder: (context, index) => ProductCard(
              itemNo: index,
              product: demoProducts[index],
            ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:1,
              crossAxisSpacing: 15,
                mainAxisSpacing: 15,
             ),
            ),
          ]
        ),
      ),
    );
   }
 }