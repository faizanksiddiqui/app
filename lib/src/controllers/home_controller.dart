import 'dart:async';

import 'package:faizanks/src/utils/image_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final currentIndexImageSilder = 0.obs;

  PageController pageController = PageController();

  final imageList = [ImageConstant.image1, ImageConstant.image2, ImageConstant.image3];

  final Completer<GoogleMapController> googleController = Completer();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final markers = RxList<Marker>().obs;

  @override
  void onInit() {
    super.onInit();
    addMarker();
  }

  @override
  void onClose() {
    logout();
    super.onClose();
  }

  // logout fom firebase
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void addMarker() {
    markers.value.add(
      const Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(title: 'The title of the marker'),
      ),
    );
  }

  // Image silder indicator
  // this function use for color change indicator
  void onChangeIndicator(int value) {
    currentIndexImageSilder.value = value;
  }
}
