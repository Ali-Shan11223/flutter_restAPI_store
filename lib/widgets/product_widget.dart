import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/models/products_model.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../views/product_detail_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsModel>(context);

    final mHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: ProductDetails(id: productsProvider.id.toString(),), type: PageTransitionType.fade));
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
                  height: mHeight * 0.18,
                  boxFit: BoxFit.cover,
                  errorWidget: const Icon(
                    Icons.dangerous,
                    color: Colors.red,
                    size: 30,
                  ),
                  imageUrl: productsProvider.images![0]),
            ),
            height(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                productsProvider.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
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
                      text: TextSpan(
                          text: '\$',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          children: [
                        TextSpan(
                            text: productsProvider.price.toString(),
                            style: const TextStyle(
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
