import 'package:flutter/material.dart';


class ProductResponse {
  int status;
  List<Product> data;
   String message;
  String userMsg;

  ProductResponse({this.status, this.data,this.message, this.userMsg});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Product>();
      json['data'].forEach((v) {
        data.add(new Product.fromJson(v));
      });
      message = json['message'];
      userMsg = json['user_msg'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['user_msg'] = this.userMsg;
    return data;
  }
}


class Product {
  int id;
  int productCategoryId;
  String name;
  String producer;
  String description;
  int cost;
  int rating;
  int viewCount;
  String created;
  String modified;
  String productImages;

  Product(
      {this.id,
      this.productCategoryId,
      this.name,
      this.producer,
      this.description,
      this.cost,
      this.rating,
      this.viewCount,
      this.created,
      this.modified,
      this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCategoryId = json['product_category_id'];
    name = json['name'];
    producer = json['producer'];
    description = json['description'];
    cost = json['cost'];
    rating = json['rating'];
    viewCount = json['view_count'];
    created = json['created'];
    modified = json['modified'];
    productImages = json['product_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_category_id'] = this.productCategoryId;
    data['name'] = this.name;
    data['producer'] = this.producer;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['rating'] = this.rating;
    data['view_count'] = this.viewCount;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['product_images'] = this.productImages;
    return data;
  }
}