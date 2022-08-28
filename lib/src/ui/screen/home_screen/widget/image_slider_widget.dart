import 'package:faizanks/src/controllers/home_controller.dart';
import 'package:faizanks/src/ui/common/text_widget/custom_textview.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:faizanks/src/utils/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImageSilderWidget extends StatelessWidget {
  const ImageSilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      autoRemove: false,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 190,
              child: PageView.builder(
                itemCount: controller.imageList.length,
                controller: controller.pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  controller.onChangeIndicator(value);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              height: 190,
                              color: ColorConstant.grey2,
                              child: Image.network(
                                controller.imageList[index],
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            height: 25,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: ColorConstant.grey3,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTitleTextWidget(text: StringConstant.rating),
                                const Icon(
                                  Icons.star,
                                  color: ColorConstant.white,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.imageList.length, (index) {
                return Obx(
                  () {
                    return Container(
                      height: 5,
                      width: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: controller.currentIndexImageSilder.value == index
                              ? ColorConstant.black
                              : ColorConstant.grey2),
                    );
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
