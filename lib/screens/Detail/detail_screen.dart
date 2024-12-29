import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/screens/Detail/Widget/addto_cart.dart';
import 'package:grocery_app/screens/Detail/Widget/description.dart';
import 'package:grocery_app/screens/Detail/Widget/detail_app_bar.dart';
import 'package:grocery_app/screens/Detail/Widget/items_details.dart';
import 'package:grocery_app/screens/Home/Widget/image_slider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddToCart(product: product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(
                product: product,
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
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
                    ItemsDetails(product: product),
                    const SizedBox(height: 20),
                    Description(
                      description: product.description,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
