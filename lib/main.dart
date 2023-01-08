import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resturants_test/controllar/populer_product_controllars.dart';
import 'package:resturants_test/route/routes_helper.dart';
import 'package:resturants_test/scren/home_page.dart';
import 'package:resturants_test/scren/recommended%20food%20details.dart';
import 'controllar/recommended_controller.dart';
import 'helpre/dependencies.dart' as dep;
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const page1());
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    Get.find<Populerproductcontroller>().getpopulerproductlist();
    Get.find<Recommendedproductcontroller>().getRecommendedproductlist();

    return GetMaterialApp(
      // home: Recommended_Food_details(),
      //home: populer_food_details(),
      home: homescrren(),

      initialRoute: routeHelper.initial,

      getPages: routeHelper.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
