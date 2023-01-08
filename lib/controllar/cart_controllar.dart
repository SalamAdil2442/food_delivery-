import 'package:get/get.dart';
import 'package:resturants_test/date/repositore/cart_repo.dart';
import 'package:resturants_test/model/product_model.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, Cartmodel> _Item = {};

  void AddItem(Productmodel product, int quantity) {
    _Item.putIfAbsent(product.id!, () {
      print("add item");
      return Cartmodel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
    });
  }
}
