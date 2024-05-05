import 'package:aliza_ecommerce/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class SliderBody extends StatefulWidget {

  List<String> imgList =[
    'assets/images/splash3.jpg',
    'assets/images/sofa.jpg',
    "assets/images/splash1.jpg",
    "assets/images/splash2.jpg",
  ];

  // SliderBody({required this.imgList});

  @override
  State<SliderBody> createState() => _SliderBodyState();
}

class _SliderBodyState extends State<SliderBody> {
  int _current =0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList.map((item) =>
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Stack(
              children: [
                Image.asset(item,fit: BoxFit.cover,width: 350,),
                Positioned(
                  bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200,0,0,0),
                            Color.fromARGB(0,0,0,0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    )
                )
              ],
            ),
          ),
        )).toList();
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(15),
        ),
        CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason){
                setState(() {
                  _current = index;
                 }
                );
               }
              ),
           ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((data) {
            int index = widget.imgList.indexOf(data);
            return AnimatedContainer(
              duration: kAnimationDuration,
              margin: EdgeInsets.only(right: 5),
              height: 6,
              width: _current == index ? 20 : 6,
              decoration: BoxDecoration(
                color: _current == index ? kPrimaryColor : Color(0xFFD8D8D8),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
