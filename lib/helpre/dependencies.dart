import 'package:get/get.dart';
import 'package:resturants_test/controllar/cart_controllar.dart';
import 'package:resturants_test/controllar/populer_product_controllars.dart';
import 'package:resturants_test/controllar/recommended_controller.dart';
import 'package:resturants_test/date/api/api_client.dart';
import 'package:resturants_test/date/repositore/Recommended_product_repo.dart';
import 'package:resturants_test/date/repositore/cart_repo.dart';
import 'package:resturants_test/date/repositore/populer_product_repo.dart';
import 'package:resturants_test/unit/app_constents.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => Apiclient(appbaseurl: Appconstants.bas_url));

//repo

  Get.lazyPut(() => Populerproductrepo(apiclient: Get.find()));
  Get.lazyPut(() => Recommendedproductrepo(apiclient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //list
  Get.lazyPut(
      () => Recommendedproductcontroller(recommendedproductrepo: Get.find()));
  Get.lazyPut(() => Populerproductcontroller(populerproductrepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
