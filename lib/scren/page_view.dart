import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:resturants_test/Widget/colum.dart';
import 'package:resturants_test/Widget/icon_text_string.dart';
import 'package:resturants_test/controllar/populer_product_controllars.dart';
import 'package:resturants_test/controllar/recommended_controller.dart';
import 'package:resturants_test/route/routes_helper.dart';
import 'package:resturants_test/scren/food_details.dart';
import 'package:resturants_test/model/product_model.dart';

import 'package:resturants_test/unit/app_constents.dart';

import 'package:resturants_test/unit/daimention.dart';

import '../Widget/big_text.dart';
import '../Widget/small_text.dart';

class page_view1 extends StatefulWidget {
  page_view1({super.key});

  @override
  State<page_view1> createState() => _page_viewState();
}

class _page_viewState extends State<page_view1> {
  PageController pageController = PageController(viewportFraction: 0.80);
  var _carrntnumber = 0.0;
  double _scalfoctor = 0.8;
  final _height = dimention.page_view_Container;

  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _carrntnumber = pageController.page!;
        print("number of page:" + _carrntnumber.toString());
      });
    });
  }

  void despons() {
    pageController.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    print("hight:" + MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        //call api
        GetBuilder<Populerproductcontroller>(builder: (populerpreductst) {
        
          return populerpreductst.isloader
              ? Container(
                  height: dimention.page_view,
                  //  color: Colors.redAccent,
                  // //using for new tap GestureDetector
                  //   child: GestureDetector(
                  //       onTap: (() {
                  //  this line using for a auother page dont using routes.  Get.to(() => populer_food_details());
                  //     Get.toNamed(routeHelper.popular_page_details_of_flutter);
                  // }),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: populerpreductst.populerproductlist.length,
                    itemBuilder: (context, index) {
                      return _pagev(
                          index, populerpreductst.populerproductlist[index]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: Colors.amber,
                );
        }),

        GetBuilder<Populerproductcontroller>(builder: (populerpreductst) {
          return new DotsIndicator(
            dotsCount: populerpreductst.populerproductlist.isEmpty
                ? 1
                : populerpreductst.populerproductlist.length,
            position: _carrntnumber,
            decorator: DotsDecorator(
              color: Colors.black87, 
              activeColor: Colors.redAccent,
            ),
          );
        }),

        // popular list
        SizedBox(
          height: dimention.height25,
        ),
        Container(
          margin: EdgeInsets.only(left: dimention.width25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              big_text(text: "recommended"),
              SizedBox(
                width: dimention.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: big_text(
                  text: ".",
                  color1: Colors.black26,
                ),
              ),
              SizedBox(
                width: dimention.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: text_small(
                  text: "food pairing",
                  colors_text: Colors.black45,
                ),
              )
            ],
          ),
        ),
        //recommended product
// listview builder
        GetBuilder<Recommendedproductcontroller>(builder: (recommendedProduct) {
          return recommendedProduct.isloader
              ? ListView.builder(
               
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedproductlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(routeHelper.getRecommendefood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: dimention.width10,
                            right: dimention.width10,
                            bottom: dimention.height10),
                        child: Row(
                          children: [
                        
                            Container(
                              width: dimention.imagesiz,
                              height: dimention.imagesiz,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(dimention.radius20),
                                color: Colors.amberAccent,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Appconstants.bas_url +
                                        "/uploads/" +
                                        recommendedProduct
                                            .recommendedproductlist[index]
                                            .img!)),
                              ),
                            )
                            //text sections
                            //NetworkImage(Appconstants.bas_url +
                            //"/uploads/" +
                            // populerproduct.img!)),
                            ,
                            Expanded(
                              child: Container(
                                height: 120,
                                //  width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(dimention.radius20),
                                        bottomRight: Radius.circular(
                                            dimention.radius20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: dimention.width10,
                                      right: dimention.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      big_text(
                                        text: recommendedProduct
                                            .recommendedproductlist[index]
                                            .name!,
                                      ),
                                      SizedBox(height: dimention.height10),
                                      text_small(
                                          text: recommendedProduct
                                              .recommendedproductlist[index]
                                              .description!),
                                      SizedBox(
                                        height: dimention.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          icon_text(
                                              icons: Icons.circle_sharp,
                                              texts: "Normall",
                                              coloricon: Color.fromARGB(
                                                  255, 172, 181, 175),
                                              colortext:
                                                  Color.fromARGB(179, 0, 0, 0)),
                                          icon_text(
                                              icons: Icons.location_city,
                                              texts: "17.2",
                                              coloricon: Color.fromARGB(
                                                  255, 250, 2, 2),
                                              colortext: Color.fromARGB(
                                                  179, 129, 7, 7)),
                                          icon_text(
                                              icons: Icons.av_timer_rounded,
                                              texts: "min",
                                              coloricon: Color.fromARGB(
                                                  255, 250, 2, 2),
                                              colortext: Color.fromARGB(
                                                  179, 129, 7, 7))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: Colors.amberAccent,
                );
        }),
      ],
    );
  }

  Widget _pagev(int index, Productmodel populerproduct) {
    Matrix4 matrix1 = new Matrix4.identity();
    if (index == _carrntnumber.floor()) {
      var scal = 1 - (_carrntnumber - index) * (1 - _scalfoctor);
      var currtrans = _height * (1 - scal) / 2;

      matrix1 = Matrix4.diagonal3Values(1, scal, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == _carrntnumber.floor() + 1) {
      var scal = _scalfoctor + (_carrntnumber - index + 1) * (1 - _scalfoctor);
      var currtrans = _height * (1 - scal) / 2;
      var heght1 = matrix1 = Matrix4.diagonal3Values(1, scal, 1);
      matrix1 = Matrix4.diagonal3Values(1, scal, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == _carrntnumber.floor() - 1) {
      var scal = 1 - (_carrntnumber - index) * (1 - _scalfoctor);
      var currtrans = _height * (1 - scal) / 2;

      matrix1 = Matrix4.diagonal3Values(1, scal, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      var currstel = 0.8;
      matrix1 = Matrix4.diagonal3Values(1, currstel, 1)
        ..setTranslationRaw(0, _height * (1 - _scalfoctor) / 2, 1);
    }

    return Transform(
      transform: matrix1,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(routeHelper.getpopularfood(index));
              },
              child: Container(
                height: dimention.page_view_Container,
                margin: EdgeInsets.only(
                    left: dimention.width4, right: dimention.width4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimention.radius30),
                  color: Colors.amberAccent,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(Appconstants.bas_url +
                          "/uploads/" +
                          populerproduct.img!)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: dimention.page_view_text_Container,
              margin: EdgeInsets.only(
                  left: dimention.width25,
                  right: dimention.width25,
                  bottom: dimention.height13,
                  top: dimention.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimention.radius30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 5.6, offset: Offset(0, 5)
                      //       offset: Offset(5, 0),
                      ),
                  BoxShadow(
                      color: Color.fromARGB(255, 245, 243, 243),
                      //   blurRadius: 2,
                      offset: Offset(-5, 0)
                      //       offset: Offset(5, 0),
                      ),
                  BoxShadow(
                      color: Color.fromARGB(255, 252, 249, 249),
//blurRadius: 5.6,
                      offset: Offset(5, 0)
                      //       offset: Offset(5, 0),
                      )
                ],
              ),
              child: Container(
                  margin: EdgeInsets.only(
                      left: dimention.width15,
                      top: dimention.height15,
                      right: dimention.width4),
                  child: page_colum(
                    text_of_name_of_foot: populerproduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
