
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturants_test/controllar/cart_controllar.dart';
import 'package:resturants_test/date/repositore/populer_product_repo.dart';
import 'package:resturants_test/model/product_model.dart';

class Populerproductcontroller extends GetxController {
  final Populerproductrepo populerproductrepo;

  Populerproductcontroller({required this.populerproductrepo});
  List<dynamic> _populerproductlist = [];
  List<dynamic> get populerproductlist => _populerproductlist;


  late CartController _cart;

  bool _isloaded = false;
  bool get isloader => _isloaded;
  int _quantity = 0;
  int get quantity => _quantity; 

  int _IncartItems = 0;

  int get InCartItem => _IncartItems + _quantity;

  Future<void> getpopulerproductlist() async {
    Response response = await populerproductrepo.getpopulerproductrepolist();
    if (response.statusCode == 200) {
      print("got product object");
      _populerproductlist = [];
      _populerproductlist.addAll(productmodel.fromJson(response.body).products);
      print(_populerproductlist);
      // loaded date
      _isloaded = true;
      update();
    } else {
      print("could not get product populerpage");
    }
  }


  void SetQuantity(bool IsIncremnt) {
    if (IsIncremnt) {
      _quantity = cheakQuantity(_quantity + 1);
    } else {
      _quantity = cheakQuantity(_quantity - 1);
    }
    update();
  }

  int cheakQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item Count", "You Can't Reduce More",
          backgroundColor: Colors.amberAccent);
      return 0;
    }
    if (quantity > 20) {
      Get.snackbar("Item Count", "You Can't Add More",
          backgroundColor: Colors.amberAccent);
      return 20;
    } else {
      return quantity;
    }
  }

  void initoroduct(CartController cart) {
    _quantity = 0;
    _IncartItems = 0;
    _cart = cart;
  }

  void Additem_1(productmodel product) {

  }
}
