// {
// "ProductName": "srijon",
// "ProductCode": 2565145,
// "Img": "sfsa",
// "Qty": 45,
// "UnitPrice": 14,
// "TotalPrice": 888
// }

class ProductModel{
late String name;
late int code;
late String img;
late int quantity;
late int price;
late int totalPrice;
late String id;

ProductModel.fromJson(Map<String,dynamic>productJson){
id=productJson['_id'];
name=productJson['ProductName'];
code=productJson['ProductCode'];
img=productJson['Img'];
quantity=productJson['Qty'];
price=productJson['UnitPrice'];
totalPrice=productJson['TotalPrice'];
}
}