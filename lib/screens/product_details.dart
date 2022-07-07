
import 'package:flutter/material.dart';

import '../containers/home_container.dart';
import '../containers/productsDetails_container.dart';
import '../model/arguments.dart';


class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(body: ProductDetailsBackground(),
      appBar: AppBar(
        title: Text("${args.name ?? ""}"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
class ProductDetailsBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child:
      ProductDetailsContainer(),
    );
  }
}

