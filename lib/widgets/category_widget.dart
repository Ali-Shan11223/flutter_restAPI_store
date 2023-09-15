import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: mHeight * 0.17,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        width: mWidth * 0.28,
                        errorWidget: const Icon(
                          Icons.dangerous,
                          color: Colors.red,
                          size: 30,
                        ),
                        boxFit: BoxFit.cover,
                        imageUrl:
                            'https://images.pexels.com/photos/6157041/pexels-photo-6157041.jpeg?auto=compress&cs=tinysrgb&w=600',
                      ),
                    ),
                  ),
                  height(10),
                  const Text(
                    'Title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 0.01,
                  )
                ],
              ),
            );
          }),
    );
  }
}
