import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Widgets/snackbarText.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}
class _AddOrderState extends State<AddOrder> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final TextEditingController _orderNameController=TextEditingController();
  final TextEditingController _codeController=TextEditingController();
  final TextEditingController _priceController=TextEditingController();
  final TextEditingController _quantityController=TextEditingController();
  final TextEditingController _imageController=TextEditingController();
  bool _addProductInProgress=false;
  @override
  void dispose(){
    _orderNameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _codeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Order'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //order name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _orderNameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Order Name',
                  hintText: 'Order Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) return 'Enter Value';
                    return null;
                  }
              ),
            ),
            //code
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _codeController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Code',
                    hintText: 'Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) return 'Enter Value';
                    return null;
                  }
              ),
            ),
            //price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) return 'Enter Value';
                    return null;
                  }
              ),
            ),
            //quantity
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: _quantityController,
                decoration: InputDecoration(
                    labelText: 'quantity',
                    hintText: 'quantity',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true) return 'Enter Value';
                    return null;
                  }
              ),
            ),

            //image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                    labelText: 'image url',
                    hintText: 'image url',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true) return 'Enter Value';
                   return null;
                },
              ),
            ),
            //save button
            SizedBox(height: 8),
            Visibility(
              visible: _addProductInProgress==false,
              replacement: Center(child: CircularProgressIndicator()),
              child: FilledButton(
                  onPressed: _onTapAddProduct, child: Text('Add Order')),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _onTapAddProduct() async {
    if(_formKey.currentState!.validate()==false) return;
    _addProductInProgress=true;
    setState(() {});
    //prepare url
    Uri uri=Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    //prepare data
    int totalPrice=int.parse(_priceController.text)*int.parse(_quantityController.text);
     Map<String,dynamic> requestBody={
    "ProductName":_orderNameController.text,
    "ProductCode": int.parse(_codeController.text.trim()),
    "Img": _imageController.text,
    "Qty": int.parse(_quantityController.text.trim()),
    "UnitPrice": _priceController.text.trim(),
    "TotalPrice": (totalPrice)
  };
    //request data
   Response response=await post(
       uri,
       headers: {
         'Content-Type':'application/json'
       },
       body: jsonEncode(requestBody)
   );
   print(response.statusCode);
   print(response.body);
   if(response.statusCode==200){
     final decodedJson=jsonDecode(response.body);
     if(decodedJson['status']=='success'){
       _clearTextField();
       showSnackBar(context,'successful');
     }
     else{
       String errorMessage=decodedJson['data'];
       showSnackBar(context,errorMessage);
     }
   }
   _addProductInProgress=false;
   setState(() {});
  }
  void _clearTextField(){
    _imageController.clear();
    _priceController.clear();
    _quantityController.clear();
    _codeController.clear();
    _orderNameController.clear();
  }
}
