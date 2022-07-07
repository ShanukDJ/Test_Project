import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/network_image.dart';
import '../model/arguments.dart';
import '../screens/product_details.dart';
import '../service/get_products.dart';



class HomeContainer extends StatefulWidget {

  const HomeContainer({
    Key key,
  }) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();


}

class _HomeContainerState extends State<HomeContainer> {

@override
  void initState() {
    super.initState();
    fetchProducts();
  }

  String mainImage(dynamic product){
    return product['mainImage'];
  }

  String name(dynamic product){
    return product['name'];
  }
  String brandName(dynamic product){
    return product['brandName'];
  }

  String priceAmount(dynamic product){
    return product['price']["amount"];
  }

String priceCurrency(dynamic product){
  return product['price']["currency"];
}

List<dynamic> sizes(dynamic product){
  return product['sizes'];
}

String stockStatus(dynamic product){
  return product['stockStatus'];
}
String description(dynamic user){
  return user['description'];
}
  String color(dynamic user){
    return user['colour'];
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SingleChildScrollView(
        child: Stack(
          children: [
            FutureBuilder<List<dynamic>>(
              future: fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  itemCount: snapshot.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    },
                  itemBuilder: (BuildContext context, int index){
                    return
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey
                            )
                        ),
                        child: Card(
                          elevation: 0.0,
                          semanticContainer: true,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => ProductDetails(),
                                  settings: RouteSettings(
                                  arguments:  Arguments(
                                      (name(snapshot.data[index])),
                                      (brandName(snapshot.data[index])),
                                      (mainImage(snapshot.data[index])),
                                      (priceAmount(snapshot.data[index])),
                                      (priceCurrency(snapshot.data[index])),
                                      (sizes(snapshot.data[index])),
                                      (stockStatus(snapshot.data[index])),
                                      (color(snapshot.data[index])),
                                      (description(snapshot.data[index]))
                                  ))));
                                },
                                child: ListTile(
                                  leading:
                                  Container(
                                    child:
                                      ImageFromURL(
                                        url: mainImage(snapshot.data[index]),
                                        width: 85.w,
                                        height: 85.h,
                                          fit: BoxFit.cover
                                      )
                                  ),

                                  title: Text(name(snapshot.data[index])),
                                  subtitle:  Text(
                                    "Brand ${brandName(snapshot.data[index])}",
                                    textAlign: TextAlign.start,),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                  }
              );
              }
               else {
               return Center(child:  Column(
                 children: [
                   SizedBox(
                     height: 100,
                   ),
                   CircularProgressIndicator(),
                   SizedBox(
                     height: 5,
                   ),
                   Text('Loading! Please Wait....')
                 ],
               ),);
            }
          },
        ),
          ],
        ),
    );
  }
}
