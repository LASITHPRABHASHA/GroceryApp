import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/screens/Detail/Widget/addto_cart.dart';
import 'package:grocery_app/screens/Detail/Widget/description.dart';
import 'package:grocery_app/screens/Detail/Widget/detail_app_bar.dart';
import 'package:grocery_app/screens/Detail/Widget/items_details.dart';
import 'package:grocery_app/screens/Detail/image_slider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      // for add to cart , icon and quantity
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for back button share and favorite,
            DetailAppBar(
              product: widget.product,
            ),
            // for detail image slider
            MyImageSlider(
              image: widget.product.image,
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for product name, price, rating, and seller
                  ItemsDetails(product: widget.product),
                  const SizedBox(height: 20),
                  // for description
                  Description(
                    description: widget.product.description,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
