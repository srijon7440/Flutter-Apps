import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:order_app/Models/product_model.dart';

import '../Screens/update_order.dart';
import '../uri/uri.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product, required this.refreshProductList,});
  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteInProgress=false;

  //future
  Future<void>_deleteProduct() async{
    _deleteInProgress=true;
    setState(() {});
    Uri uri=Uri.parse(Urls.deleteProductUrl(widget.product.id));
    Response response=await get(uri);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode==200){
      widget.refreshProductList();
      }
    _deleteInProgress=false;
    setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 40,
        widget.product.img,errorBuilder: (_,__,___){
        return Icon(Icons.error_outline,size: 30,);
      }
      ),
      title: Text(widget.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${widget.product.code}'),
          Row(
            spacing: 15,
            children: [
              Text('Price:${widget.product.price}'),
              Text('Quantity:${widget.product.quantity}')
            ],
          )
        ],
      ),
      trailing:Visibility(
        visible: _deleteInProgress==false,
        replacement: CircularProgressIndicator(),
        child: PopupMenuButton<ProductCustom>(
          itemBuilder: (context){
            return [
              PopupMenuItem(
                  value: ProductCustom.update,
                  child: Text('update')
              ),
              PopupMenuItem(
                  value: ProductCustom.delete,
                  child: Text('delete')
              )
            ];
          },
          onSelected: (ProductCustom selectedOption){
            if(ProductCustom.delete==selectedOption) {
              _deleteProduct();
              print('deleted');
            }
            else if(ProductCustom.update==selectedOption){
              print('updated');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateOrder(
                product: widget.product,)
              )
              );
            }
          },
        ),
      ),
    );
  }
}
enum ProductCustom{
  update,
  delete
}
