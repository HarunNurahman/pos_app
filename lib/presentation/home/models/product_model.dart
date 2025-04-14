import 'package:pos_app/core/extensions/int_ext.dart';
import 'package:pos_app/presentation/home/models/product_category_model.dart';

class ProductModel {
  final String image;
  final String name;
  final ProductCategoryModel category;
  final int price;
  final int stock;

  ProductModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
  });

  String get priceFormat => price.currencyFormatRp;
}
