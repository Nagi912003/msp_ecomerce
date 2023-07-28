import 'package:flutter/material.dart';
import 'package:movingacard/models/product.dart';
import 'package:movingacard/screens/product_detail_screen.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key, required this.loadedProducts});
  final List<Product> loadedProducts;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: loadedProducts
          .map(
            (product) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      product.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailScreen(
                      // ),),);
                    },
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ).toList(),
    );
  }
}
