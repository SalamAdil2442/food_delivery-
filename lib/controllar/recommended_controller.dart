import 'dart:ffi';

import 'package:get/get.dart';
import 'package:resturants_test/date/repositore/Recommended_product_repo.dart';
import 'package:resturants_test/date/repositore/populer_product_repo.dart';
import 'package:resturants_test/model/product_model.dart';

class Recommendedproductcontroller extends GetxController {
  final Recommendedproductrepo recommendedproductrepo;

  Recommendedproductcontroller({required this.recommendedproductrepo});
  List<dynamic> _recommendedproductlist = [];
  List<dynamic> get recommendedproductlist => _recommendedproductlist;
  
  bool _isloaded = false;
  bool get isloader => _isloaded;
  Future<void> getRecommendedproductlist() async {
    Response response =
        await recommendedproductrepo.getRecommendedproductrepolist();
    if (response.statusCode == 200) {
      print("got product recommended");
      _recommendedproductlist = [];
      _recommendedproductlist
          .addAll(productmodel.fromJson(response.body).products);

      // loaded date
      _isloaded = true;
      update();
    } else {
      print("could not get product recommended");
    }
  }
}
