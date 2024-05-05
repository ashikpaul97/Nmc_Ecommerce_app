import 'package:flutter/material.dart';
import 'package:aliza_ecommerce/model/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.99,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              decoration: BoxDecoration(
                color: Color(0xFFF6DDBF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 18),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "\$${cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                   // children: [
                     // TextSpan(
                         // text: " x${cart.numOfItem}",
                         // style: Theme.of(context).textTheme.bodyText1),
                   // ],
                  ),
                ),
                SizedBox(width: 30,),
                InkWell(

                  onTap: (){},

                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6DDBF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Card(
                      child: Text("-",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(width: 5,),

                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6DDBF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Card(
                    child: Text("${cart.numOfItem}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
                  ),
                  ),
                SizedBox(width: 5,),
                InkWell(

                  onTap: (){
                    //print("tapped");
                     cart.numOfItem = cart.numOfItem + 1;
                     },

                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6DDBF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Card(
                      child: Text("+",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),

              ],
            )
          ],
        )
      ],
    );
  }
}