import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:resturants_test/Widget/Add_icon_for_detail.dart';
import 'package:resturants_test/Widget/big_text.dart';
import 'package:resturants_test/Widget/colum.dart';
import 'package:resturants_test/Widget/expanable_text.dart';
import 'package:resturants_test/Widget/icon_text_string.dart';
import 'package:resturants_test/Widget/small_text.dart';
import 'package:resturants_test/controllar/cart_controllar.dart';
import 'package:resturants_test/controllar/populer_product_controllars.dart';
import 'package:resturants_test/scren/home_page.dart';
import 'package:resturants_test/scren/page_view.dart';
import 'package:get/get.dart';
import 'package:resturants_test/unit/app_constents.dart';
import 'package:resturants_test/unit/daimention.dart';

class populer_food_details extends StatefulWidget {
  // page id
  int pageId;
  populer_food_details({super.key, required this.pageId});

  @override
  State<populer_food_details> createState() => _populer_food_detailsState();
}

class _populer_food_detailsState extends State<populer_food_details> {
  @override
  Widget build(BuildContext context) {
    //for page Id to pages
    var product =
        Get.find<Populerproductcontroller>().populerproductlist[widget.pageId];

    Get.find<Populerproductcontroller>()
        .initoroduct(Get.find<CartController>());
//pageId for your pages
    ///
    return Scaffold(
        body: Stack(
          children: [
            /*
          image: NetworkImage(Appconstants.bas_url +
                                        "/uploads/" +
                                        recommendedProduct
                                            .recommendedproductlist[index]
                                            .img!)),*/
            //backround image
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                height: dimention.popularimagefood,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          Appconstants.bas_url + "/uploads/" + product.img)),
                ),
              ),
            ),
            //icon widget
            Positioned(
              top: 30,
              left: dimention.width20,
              right: dimention.width25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.to(() => homescrren());
                    }),
                    child: Add_icons(
                      icons: Icons.arrow_back,
                    ),
                  ),
                  Add_icons(icons: Icons.shopping_cart_outlined)
                ],
              ),
            ),
            
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: dimention.popularimagefood - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: dimention.width20,
                      right: dimention.width20,
                      top: dimention.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dimention.radius20),
                        topRight: Radius.circular(dimention.radius20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      page_colum(
                        text_of_name_of_foot: product.name!,
                      ),
                      SizedBox(
                        height: dimention.height10,
                      ),
                      big_text(text: "Introduce"),

                      SizedBox(
                        height: dimention.height10,
                      ),
                      // this lien using to read more
                      Expanded(
                          child: SingleChildScrollView(
                        child: TextWrapper(text: product.description!),
                      ))
                    ],
                  )),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<Populerproductcontroller>(
          builder: (popular_product) {
            return Container(
              height: dimention.bottomNatibar,
              padding: EdgeInsets.only(
                  top: dimention.height30,
                  bottom: dimention.height30,
                  right: dimention.width20,
                  left: dimention.width20),
              decoration: BoxDecoration(
                  // color: Colors.amberAccent,
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimention.radius20 * 2),
                      topRight: Radius.circular(dimention.radius20 * 2))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: dimention.height20,
                          bottom: dimention.height20,
                          left: dimention.width20,
                          right: dimention.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimention.radius20),
                          color: Colors.white),
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              popular_product.SetQuantity(false);
                            },
                            child: Icon(Icons.remove)),
                        SizedBox(
                          width: dimention.width10 / 2,
                        ),
                        big_text(text: popular_product.quantity.toString()),
                        SizedBox(
                          width: dimention.width10 / 2,
                        ),
                        GestureDetector(
                            onTap: () {
                              popular_product.SetQuantity(true);
                            },
                            child: Icon(Icons.add))
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: dimention.height20,
                          bottom: dimention.height20,
                          left: dimention.width20,
                          right: dimention.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimention.radius20),
                          color: Colors.lightBlue.shade600),
                      child: GestureDetector(
                          onTap: () {
                            popular_product.Additem_1(product);
                          },
                          child: big_text(
                              text: "\$${product.price!}| Add to cart")),
                    )
                  ]),
            );
          },
        ));
  }
}
/*,*/