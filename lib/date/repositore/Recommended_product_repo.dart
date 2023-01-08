import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/date/api/api_client.dart';
import 'package:resturants_test/unit/app_constents.dart';

class Recommendedproductrepo extends GetxService {
  final Apiclient apiclient;

  Recommendedproductrepo({required this.apiclient});

  Future<Response> getRecommendedproductrepolist() async {
    return await apiclient.getdate(Appconstants.recommened_product_url);
  }
}
