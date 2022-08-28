import 'package:faizanks/src/ui/common/text_widget/custom_textview.dart';
import 'package:faizanks/src/utils/string_constant.dart';
import 'package:flutter/material.dart';

class ShopInfoWidget extends StatelessWidget {
  const ShopInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: CustomTitleTextWidget(
                  text: StringConstant.title,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                  textSize: 18),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.eight_k_plus,size: 18,),
                  CustomTitleTextWidget(text: StringConstant.time, fontWeight: FontWeight.bold, textSize: 14),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        CustomTitleTextWidget(text: StringConstant.subTitle, fontWeight: FontWeight.bold, textSize: 14),
        CustomTitleTextWidget(text: StringConstant.number, fontWeight: FontWeight.normal, textSize: 14),
        const SizedBox(height: 10),
        CustomTitleTextWidget(text: StringConstant.description, fontWeight: FontWeight.normal, textSize: 14),
        const SizedBox(height: 10),
      ],
    );
  }
}
