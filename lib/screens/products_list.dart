import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store/model/product.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<Product> productsList = new List<Product>();
  double finalPrice;
  final List<String> _listItem = [
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<10;i++) {
      Product product =new Product();
      product.itemName = "Chair "+i.toString();
      product.itemDes = "chair is a piece of furniture. It is used for sitting on and it can also be used for standing of,"
          " if you can't reach something. They usually have four legs to support the weight.";
      product.itemQty = i;
      product.price = 300 + i.toDouble();
      product.itemAdded =0;
      productsList.add(product);
    }
    finalPrice = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title: Text("Products"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 60,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(finalPrice.toString())),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context,index) {
            int newIndex = index +1;
        return ExpansionTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: new Image.asset('assets/minus.png',color: Colors.white,),
                tooltip: 'Closes application',
                onPressed: () {
                  if(productsList[index].itemAdded !=0) {
                    --productsList[index].itemAdded;
                    setState(() {
                      finalPrice =
                          finalPrice==0? 0 : finalPrice - productsList[index].price;
                    });
                  }
                },
              ),
              SizedBox(width: 10,),
              Text(productsList[index].itemAdded.toString(),style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),
              IconButton(
                icon: new Image.asset('assets/add.png',color: Colors.white,scale: 0.3,),
                tooltip: 'Closes application',
                onPressed: () {
                  ++productsList[index].itemAdded;
                  setState(() {
                    finalPrice =
                          finalPrice + productsList[index].price;
                  });
                },
              ),
              SizedBox(width: 40,),
              Icon(Icons.expand_more,color: Colors.white,),
            ],
          ),
        leading: Icon(Icons.ac_unit,color: Colors.white,),
          title: Text("Chair "+index.toString(),style: TextStyle(color: Colors.white),),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(_listItem[8 % newIndex]),
                          fit: BoxFit.fitWidth
                      )
                  ),
                  child: Transform.translate(
                    offset: Offset(50, -50),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: Icon(Icons.bookmark_border, size: 15,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Item Name :",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 3,),
                      Expanded(
                          child:Text(productsList[index].itemName,style: TextStyle(color: Colors.white),)),

                  ],),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Details : ",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 3,),
                      Expanded(
                          child:Text(productsList[index].itemDes,style: TextStyle(color: Colors.white),)),
                    ],),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Price : ",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 10,),
                      Expanded(child:Text(productsList[index].price.toString(),style: TextStyle(color: Colors.white),)),
                    ],),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ],
        );

      }),
    );
  }
}
