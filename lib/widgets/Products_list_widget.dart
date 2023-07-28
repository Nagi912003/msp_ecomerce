import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products.dart';
import '../screens/product_detail_screen.dart';

class ProductsListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context).items;
    return ListView.builder(
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductItem(),
      ),
      itemCount: loadedProducts.length,
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
final product = Provider.of<Product>(context);
final productsData = Provider.of<Products>(context, listen: false);
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: IconButton(
          onPressed: (){
            product.toggleFavoriteStatus();
          },
          icon: product.isFavorite?const Icon(Icons.favorite): const Icon(Icons.favorite_border),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetailScreen(productId: product.id,),
            ),
          );
        });
  }
}
