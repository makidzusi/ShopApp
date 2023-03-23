import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:shop_app/widgets/products_grid.dart';
import '../models/products.dart';

enum FilterOptions { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    // final loadedProdcuts = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("ShopApp"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Показать только избранные"),
                value: FilterOptions.Favourites,
              ),
              const PopupMenuItem(
                child: Text("Показать все"),
                value: FilterOptions.Favourites,
              )
            ],
          )
        ],
      ),
      body: SafeArea(
          child: ProductsGrid(
        showFavs: _showOnlyFavourites,
      )),
    );
  }
}
