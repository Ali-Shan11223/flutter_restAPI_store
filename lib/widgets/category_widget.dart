import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi_storeapp/models/category_model.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/app_constants.dart';
import '../services/api_handler.dart';
import '../views/view_category.dart';

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
        child: FutureBuilder<List<CategoryModel>>(
            future: APIHandler.getAllCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('An error occured: ${snapshot.hasError}'),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text('No category has been fetched yet!!!'),
                );
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: ViewCategory(id: data.id.toString(),
                                  title: data.name.toString(),
                                  ),
                                  type: PageTransitionType.fade));
                        },
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
                                  imageUrl: data.image.toString(),
                                ),
                              ),
                            ),
                            height(10),
                            Text(
                              data.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 0.01,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
