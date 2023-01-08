import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:resturants_test/main.dart';
import 'package:resturants_test/scren/food_details.dart';
import 'package:resturants_test/scren/home_page.dart';
import 'package:resturants_test/scren/recommended%20food%20details.dart';
import 'package:get/get.dart';

class routeHelper {
  static const String initial = "/";
  static const String popular_page_details_of_flutter = "/popular-page";
  static const String recommendedfood = "/recommended-page";

  static String getintial() => "$initial";
  //page Id for you pages
  static String getpopularfood(int PageId) =>
      "$popular_page_details_of_flutter?PageId=$PageId";

  //recommended
  static String getRecommendefood(int PageId) =>
      '$recommendedfood?PageId=$PageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => homescrren(),
        transition: Transition.leftToRight),
    GetPage(
      name: popular_page_details_of_flutter,
      page: () {
        // page Id for your pages== var pageid = Get.parameters["PageId"];

        var pageid = Get.parameters["PageId"];
        return populer_food_details(
          pageId: int.parse(pageid!),
        );
      },
      transition: Transition.zoom,
    ),
    GetPage(
      name: recommendedfood,
      page: () {
        var pageid = Get.parameters["PageId"];
        return Recommended_Food_details(
          PageId: int.parse(pageid!),
        );
      },
      transition: Transition.zoom,
    )
  ];
}
