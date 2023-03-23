import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String id;

  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Product>(
      builder: (context, product, child) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            leading: IconButton(
              onPressed: () {
                product.toggleFavourite();
              },
              icon: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_bag_rounded),
              onPressed: () {},
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
