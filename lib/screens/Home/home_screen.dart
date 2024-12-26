import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/screens/Home/Widget/product_cart.dart';
import 'package:grocery_app/screens/Home/Widget/search_bar.dart';
import '../../models/category.dart';
import 'Widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Product> currentProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCategoryProducts();
  }

  Future<void> loadCategoryProducts() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Get the category name in lowercase
      String category = categoriesList[selectedIndex].title.toLowerCase();
      // Load products for the selected category
      List<Product> products = await ProductRepository.loadProducts(category);

      setState(() {
        currentProducts = products;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        currentProducts = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const CustomAppBar(),
              const SizedBox(height: 20),
              const MySearchBAR(),
              const SizedBox(height: 20),
              categoryItems(),
              const SizedBox(height: 20),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (currentProducts.isEmpty)
                const Center(
                  child: Text(
                    'No products available',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              else
                GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: currentProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: currentProducts[index],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              loadCategoryProducts();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(categoriesList[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
