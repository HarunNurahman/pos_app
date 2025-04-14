import 'package:flutter/material.dart';
import 'package:pos_app/core/assets/assets.gen.dart';
import 'package:pos_app/core/components/menu_button.dart';
import 'package:pos_app/core/components/search_input.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/presentation/home/models/product_category_model.dart';
import 'package:pos_app/presentation/home/models/product_model.dart';
import 'package:pos_app/presentation/home/widgets/product_card.dart';
import 'package:pos_app/presentation/home/widgets/product_empty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final indexValue = ValueNotifier(0);

  List<ProductModel> searchResult = [];
  final List<ProductModel> products = [
    ProductModel(
      image: Assets.images.f1.path,
      name: 'Nutty Latte',
      category: ProductCategoryModel.drink,
      price: 25000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f2.path,
      name: 'Cafe Latte',
      category: ProductCategoryModel.drink,
      price: 23000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f3.path,
      name: 'Cappucino',
      category: ProductCategoryModel.drink,
      price: 24000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f4.path,
      name: 'Caramel Macchiato',
      category: ProductCategoryModel.drink,
      price: 29000,
      stock: 10,
    ),
  ];

  @override
  void initState() {
    searchResult = products;
    super.initState();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    indexValue.value = index;
    if (index == 0) {
      searchResult = products;
    } else {
      searchResult =
          products
              .where(
                (e) => e.category.index.toString().contains(index.toString()),
              )
              .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return ProductEmpty();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu', style: TextStyle(fontWeight: bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          SearchInput(
            controller: searchController,
            onChanged: (value) {
              indexValue.value = 0;
              searchResult =
                  products
                      .where(
                        (e) =>
                            e.name.toLowerCase().contains(value.toLowerCase()),
                      )
                      .toList();
              setState(() {});
            },
          ),
          SizedBox(height: 24),
          ValueListenableBuilder(
            valueListenable: indexValue,
            builder:
                (context, value, child) => Row(
                  spacing: 10,
                  children: [
                    MenuButton(
                      iconPath: Assets.icons.allCategories.path,
                      label: 'Semua',
                      isActive: value == 0,
                      onTap: () => onCategoryTap(0),
                    ),
                    MenuButton(
                      iconPath: Assets.icons.food.path,
                      label: 'Makanan',
                      isActive: value == 1,
                      onTap: () => onCategoryTap(1),
                    ),
                    MenuButton(
                      iconPath: Assets.icons.drink.path,
                      label: 'Minuman',
                      isActive: value == 2,
                      onTap: () => onCategoryTap(2),
                    ),
                    MenuButton(
                      iconPath: Assets.icons.snack.path,
                      label: 'Snack',
                      isActive: value == 3,
                      onTap: () => onCategoryTap(3),
                    ),
                  ],
                ),
          ),
          SizedBox(height: 24),
          searchResult.isEmpty
              ? Padding(
                padding: EdgeInsets.only(top: 100),
                child: ProductEmpty(),
              )
              : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: searchResult.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(data: searchResult[index], onTap: () {});
                },
              ),
        ],
      ),
    );
  }
}
