import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;

  const ProductItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_bag_rounded),
          onPressed: () {},
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
