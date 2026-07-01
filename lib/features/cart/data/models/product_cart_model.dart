import 'package:hive_ce/hive.dart';
import 'package:shop_flow/core/models/products/product.dart';

part 'product_cart_model.g.dart';

@HiveType(typeId: 0)
class ProductCartModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final double price;
  @HiveField(5)
  int count;

  ProductCartModel({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.count,
  });

  factory ProductCartModel.fromProduct(Product product) {
    return ProductCartModel(
      id: product.id!,
      image: product.thumbnail!,
      title: product.title!,
      category: product.category!,
      price: product.price!,
      count: 1,
    );
  }
}
