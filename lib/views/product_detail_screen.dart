import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Category',
            style: titleTextStyle,
          ),
        ),
        height(10),
        SizedBox(
          height: mHeight * 0.35,
          child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return FancyShimmerImage(
                    width: double.infinity,
                    errorWidget: const Icon(
                      Icons.dangerous,
                      color: Colors.red,
                      size: 50,
                    ),
                    boxFit: BoxFit.cover,
                    imageUrl:
                        'https://images.pexels.com/photos/6157041/pexels-photo-6157041.jpeg?auto=compress&cs=tinysrgb&w=600');
              },
              autoplay: true,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.orange,
                      color: Colors.white,
                      activeSize: 14))),
        ),
        height(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Title',
                    style: titleTextStyle,
                  ),
                  const Spacer(),
                  RichText(
                      text: const TextSpan(
                          text: '\$',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                        TextSpan(
                            text: '154.0',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))
                      ]))
                ],
              ),
              height(10),
              Text(
                'Description',
                style: titleTextStyle,
              ),
              height(10),
              Text(
                'Lorem ipsum is dummy text for print and media and you can use it as a dummy text in your projects. This is just a dummy text. Lorem ipsum is dummy text for print and media and you can use it as a dummy text in your projects. This is just a dummy text.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
