
import 'package:flutter/material.dart';

import '../containers/home_container.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBackground(),
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
class HomeBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child:
      HomeContainer(),
    );
  }
}




