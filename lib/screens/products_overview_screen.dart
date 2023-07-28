import 'package:flutter/material.dart';
import 'package:movingacard/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:movingacard/widgets/products_grid_widget.dart';

import '../widgets/Products_list_widget.dart';

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  int viewMode = 0;

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              setState(() {
                viewMode = selectedValue;
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 0,
                child: Text('show List'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Show grid'),
              ),
            ],
          ),
        ],
      ),
      body:
      // viewMode == 0 ?
      ProductsListWidget(),
          // : ProductsGridWidget(loadedProducts: loadedProducts),
    );
  }
}



