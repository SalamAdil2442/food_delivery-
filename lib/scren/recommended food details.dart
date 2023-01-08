import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:resturants_test/Widget/Add_icon_for_detail.dart';
import 'package:resturants_test/Widget/big_text.dart';
import 'package:resturants_test/Widget/expanable_text.dart';
import 'package:resturants_test/controllar/populer_product_controllars.dart';
import 'package:resturants_test/controllar/recommended_controller.dart';
import 'package:resturants_test/route/routes_helper.dart';
import 'package:resturants_test/unit/app_constents.dart';
import 'package:resturants_test/unit/daimention.dart';
import 'package:get/get.dart';

class Recommended_Food_details extends StatelessWidget {
  int PageId;
  Recommended_Food_details({
    required this.PageId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    var product =
        Get.find<Recommendedproductcontroller>().recommendedproductlist[PageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
   
          toolbarHeight: 70,


          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(routeHelper.getintial());
                  },
                  child: Add_icons(icons: Icons.clear)),
              Add_icons(icons: Icons.shopping_cart_outlined)
            ],
          ),

         
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                child: big_text(size: dimention.font26, text: product.name!),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimention.radius20),
                      topRight: Radius.circular(dimention.radius20))),
            ),
          ),   pinned: true,
          //
          backgroundColor: Colors.yellow,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              Appconstants.bas_url + "/uploads/" + product.img,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: dimention.width4, left: dimention.width10),
                  child: ReadMoreText(
                    product.description!,
                    numLines: 2,
                    readMoreText: 'Read more',
                    readLessText: 'Read less',
                  ),
                ),
                margin: EdgeInsets.only(
                    left: dimention.width10, right: dimention.width10),
              )
            ],
          ),
        )
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: dimention.width20 * 2.5,
                right: dimention.width20 * 2.5,
                top: dimention.height10,
                bottom: dimention.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Add_icons(
                    iconsize: dimention.iconsize24,
                    iocncolor: Colors.white,
                    backroundcolor: Colors.blue,
                    icons: Icons.remove),
                big_text(text: "\$ ${product.price} X 0"),
                Add_icons(
                    iconsize: dimention.iconsize24,
                    iocncolor: Colors.white,
                    backroundcolor: Colors.blue,
                    icons: Icons.add),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.only(
                  top: dimention.height20,
                  bottom: dimention.height20,
                  left: dimention.width20,
                  right: dimention.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimention.radius20),
                  color: Colors.white),
              child: Row(children: [
                Icon(
                  Icons.favorite,
                  color: Colors.blue,
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: dimention.height20,
                  bottom: dimention.height20,
                  left: dimention.width20,
                  right: dimention.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimention.radius20),
                  color: Colors.lightBlue.shade600),
              child: big_text(text: "\$10 | Add to cart"),
            )
          ]),
        ],
      ),
    );
  }
}
