import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid({super.key, required this.showFavs});

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<Products>(context);
    var products = showFavs ? productsData.favouriteItems : productsData.items;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (BuildContext ctx, idx) {
          var item = products[idx];

          return ChangeNotifierProvider.value(
            value: item,
            child: ProductItem(),
          );
        });
  }
}
