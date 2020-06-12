import 'package:flutter/material.dart';


class Product {
  double price;
  String itemName;
  String itemDes;
  int itemQty;
  int itemAdded;

  Product({this.itemName,this.itemDes,this.price,this.itemQty,this.itemAdded});
}