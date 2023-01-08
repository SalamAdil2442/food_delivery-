import 'package:get/get_navigation/get_navigation.dart';

class productmodel {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<Productmodel> _products;
  List<Productmodel> get products => _products;
  productmodel(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }
  productmodel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Productmodel>[];
      json['products'].forEach((v) {
        _products.add(Productmodel.fromJson(v));
      });
    }
  }
}

class Productmodel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  Productmodel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  Productmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['img'] = this.img;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_id'] = this.typeId;
    return data;
  }
}
