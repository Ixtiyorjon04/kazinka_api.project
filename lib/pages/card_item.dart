import 'package:cached_network_image/cached_network_image.dart';
import 'package:dars4/pages/product_model.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final ProductModel product;
  final Function()? onTap;

  const CardItem({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 4,
                offset: const Offset(2, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _Image(
                imageUrl: product.smallImageUrl,
                price: product.prices.actualPrice,
                oldPrice: product.prices.oldPrice,
                priceTagName: product.prices.priceTagName,
              ),
              // child: CachedNetworkImage(
              //   imageUrl: product.smallImageUrl,
              //   width: double.infinity,
              //   fit: BoxFit.fill,
              // ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    product.weightParam,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("Sotib olish"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String oldPrice;
  final String priceTagName;

  const _Image({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.priceTagName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                price != oldPrice
                    ? Text(
                        oldPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                Text(price),
              ],
            ),
            // width: 100,
            // height: ,
          ),
        ),
        price != oldPrice
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    priceTagName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
