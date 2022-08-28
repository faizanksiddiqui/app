import 'package:faizanks/src/controllers/home_controller.dart';
import 'package:faizanks/src/ui/common/divider_widget/divider_widget.dart';
import 'package:faizanks/src/ui/screen/home_screen/widget/image_slider_widget.dart';
import 'package:faizanks/src/ui/screen/home_screen/widget/rating_bar_and_review_widget.dart';
import 'package:faizanks/src/ui/screen/home_screen/widget/shop_info_widget.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:faizanks/src/utils/navigate_service/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/map_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      autoRemove: false,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorConstant.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.eight_k_plus,
                  color: ColorConstant.black,
                ),
              ),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const ImageSilderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ShopInfoWidget(),
                    DividerWidget(),
                    MapWidget(),
                    RatingBarAndReviewWidget(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
