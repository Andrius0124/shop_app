import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  static const String routeName = "/productDetail";
  const ProductDetailScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
