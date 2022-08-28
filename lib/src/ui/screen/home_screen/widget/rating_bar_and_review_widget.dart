import 'package:faizanks/src/controllers/home_controller.dart';
import 'package:faizanks/src/ui/common/text_widget/custom_textview.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:faizanks/src/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RatingBarAndReviewWidget extends StatelessWidget {
  const RatingBarAndReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      autoRemove: false,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomTitleTextWidget(text: StringConstant.ratingAndReviews, textSize: 16, fontWeight: FontWeight.bold),
            CustomTitleTextWidget(text: StringConstant.numberReviews, textSize: 14, fontWeight: FontWeight.normal),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: ColorConstant.grey1,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTitleTextWidget(
                                    text: StringConstant.pushapaYadave,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    fontWeight: FontWeight.bold,
                                    textSize: 16),
                                CustomTitleTextWidget(
                                    text: StringConstant.reviewTime,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    fontWeight: FontWeight.normal,
                                    textSize: 12),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTitleTextWidget(text: StringConstant.rating),
                                const Icon(
                                  Icons.star,
                                  color: ColorConstant.black,
                                  size: 15,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTitleTextWidget(
                          text: StringConstant.description,
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          fontWeight: FontWeight.normal,
                          textSize: 14),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: ColorConstant.grey1,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(width: 1, style: BorderStyle.solid),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitleTextWidget(text: StringConstant.wentYourReview, fontWeight: FontWeight.bold, textSize: 18),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(
                        Icons.star,
                        color: ColorConstant.grey2,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
