import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/handbag.png',
      'assets/images/shoe.png',
      'assets/images/t-shirt.png'
    ];

    final mHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: mHeight * 0.20,
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  colors: [
                    Color(0xff2c3e50),
                    Color(0xffbdc3c7),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0]),
            ),
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: const FittedBox(
                        child: Text(
                          'Enjoy your day\nGet upto 50% off if you\nBuy 15 products',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )),
                Flexible(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.contain,
                      ),
                    ))
              ],
            ),
          );
        },
        // autoplay: true,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.orange,
              activeSize: 14,
            )),
      ),
    );
  }
}
