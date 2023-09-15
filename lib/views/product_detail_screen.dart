import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsModel? productsModel;

  @override
  void didChangeDependencies() {
    getProduct();
    super.didChangeDependencies();
  }

  Future<void> getProduct() async {
    productsModel = await APIHandler.getProductById(id: widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: productsModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  productsModel!.category!.name.toString(),
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
                          imageUrl: productsModel!.images![index]);
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
                          productsModel!.title.toString(),
                          style: titleTextStyle,
                        ),
                        const Spacer(),
                        RichText(
                            text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                              TextSpan(
                                  text: productsModel!.price.toString(),
                                  style: const TextStyle(
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
                      productsModel!.description.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
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
