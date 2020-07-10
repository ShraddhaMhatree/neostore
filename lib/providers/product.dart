import 'package:flutter/material.dart';

class Product{
  final int id;
  final int productCategoryId;
  final String name;
  final String producer;
  final String description;
  final double cost;
  final int rating;
  final int viewCount;
  final String created;
  final String modified;
  final String productImages;

  Product({
    @required this.id,
    @required this.productCategoryId,
    @required this.name,
    @required this.producer,
    @required this.description,
    @required this.cost,
    @required this.rating,
    @required this.viewCount,
    @required this.created,
    @required this.modified,
    @required this.productImages
  });

  
}