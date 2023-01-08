import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/date/api/api_client.dart';
import 'package:resturants_test/unit/app_constents.dart';

class Populerproductrepo extends GetxService {
  final Apiclient apiclient;

  Populerproductrepo({required this.apiclient});

  Future<Response> getpopulerproductrepolist() async {
    return await apiclient.getdate(Appconstants.popular_product_url);
  }
}
