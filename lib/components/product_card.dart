import 'package:flutter/material.dart';
import 'package:aliza_ecommerce/model/Product.dart';

class ProductCard extends StatelessWidget {
    ProductCard({
    Key? key,
      this.width = 140,
      this.aspectRetio = 1.02,
      required this.product, required int itemNo,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;


  @override
  Widget build(BuildContext context) {
    //gridview for genarate image and title from product.dart
    return Scaffold(
      body: Container(
        //width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey,//Color(0x3600000F),
              offset: Offset(4, 8),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        product.images[0],
                        width: 120,
                        height: 115,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        product.title,
                        //style: AppTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                      Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        'Tk ${product.price}',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}