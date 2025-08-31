import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:order_app/Screens/add_order.dart';
import 'package:order_app/Screens/update_order.dart';

import '../Models/product_model.dart';
import '../Widgets/product_item.dart';
import '../uri/uri.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _getProductListProgress=false;
  List<ProductModel> _productList=[];
  @override
  void initState(){
    super.initState();
    _getProductList();
  }

  //Future
  Future<void>_getProductList() async{
    _productList.clear();
    _getProductListProgress=true;
    setState(() {});
   Uri uri=Uri.parse(Urls.getProductUrl);
   Response response=await get(uri);
   debugPrint(response.statusCode.toString());
   debugPrint(response.body);
   if(response.statusCode==200){
     final decodedJson=jsonDecode(response.body);
     for(Map<String,dynamic> productJson in decodedJson['data']){
       ProductModel productModel=ProductModel.fromJson(productJson);
       _productList.add(productModel);
     }
   }
    _getProductListProgress=false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order List'
        ),
        actions: [IconButton(onPressed: (){
          _getProductList();
        }, icon: Icon(Icons.refresh))],
      ),
      body: Visibility(
        visible: _getProductListProgress==false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.separated(
            itemCount:  _productList.length,
            itemBuilder: (context,index){
              return ProductItem(
                product: _productList[index],
                refreshProductList: () {
                  _getProductList();
                },
              );
        },
          separatorBuilder:(context, int index){
              return Divider(
                indent: 5,
              );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddOrder()));
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
