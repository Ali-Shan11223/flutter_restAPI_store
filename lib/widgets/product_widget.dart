import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../views/product_detail_screen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetails()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                  height: mHeight * 0.2,
                  boxFit: BoxFit.cover,
                  errorWidget: const Icon(
                    Icons.dangerous,
                    color: Colors.red,
                    size: 30,
                  ),
                  imageUrl:
                      'https://images.pexels.com/photos/6157041/pexels-photo-6157041.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ),
            height(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Title',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            height(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          text: '\$',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          children: [
                        TextSpan(
                            text: '155.0',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))
                      ])),
                  const Spacer(),
                  const Icon(Icons.favorite_outline),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
