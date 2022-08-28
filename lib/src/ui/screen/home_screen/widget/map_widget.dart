import 'package:faizanks/src/controllers/home_controller.dart';
import 'package:faizanks/src/ui/common/separator_widget/separator_widget.dart';
import 'package:faizanks/src/ui/common/text_widget/custom_textview.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:faizanks/src/utils/image_constant.dart';
import 'package:faizanks/src/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      autoRemove: false,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      ImageConstant.markerIcon,
                      height: 25,
                      width: 15,
                    ),
                    const SeparatorWidget(color: ColorConstant.black),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleTextWidget(text: StringConstant.motiNager, textSize: 16, fontWeight: FontWeight.bold),
                      CustomTitleTextWidget(
                          text: StringConstant.shoeAddress, textSize: 14, fontWeight: FontWeight.normal),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  markers: Set<Marker>.of(controller.markers.value),
                  initialCameraPosition: controller.kGooglePlex,
                  onMapCreated: (GoogleMapController googleController) {
                    controller.googleController.complete(googleController);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
