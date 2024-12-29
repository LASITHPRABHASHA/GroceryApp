import 'package:grocery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for product title and price
        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Ensures space between the title and price
          children: [
            // Product title
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
            // Product price
            Text(
              "Rs.${product.priceInRs}",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Space between price and rating
        // Row for rating and review
        Row(
          children: [
            // Rating container
            Container(
              width: 55,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kprimaryColor,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    product.rate.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            // Product review text
            Text(
              product.review,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}
