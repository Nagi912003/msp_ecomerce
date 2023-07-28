import 'package:flutter/material.dart';
import 'package:movingacard/models/product.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});
  final productId;
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$${product.price}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            product.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ]),
    );
  }
}
