import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO:
class SvgIcons {
  SvgIcons._();
  // get 24dp svg
  static SvgPicture _svgAsset(
    String assetPath, {
    double width = 15,
    double height = 15,
  }) {
    return SvgPicture.asset(assetPath, width: width, height: height);
  }

  static Widget get checked =>
      _svgAsset('assets/icons/checked.svg', width: 20, height: 20);
  static Widget get cube => _svgAsset('assets/icons/cube.svg');
  static Widget get invoiceNo => _svgAsset('assets/icons/invoice_no.svg');
  static Widget get location => _svgAsset('assets/icons/location.svg');
  static Widget get pricetags => _svgAsset('assets/icons/pricetags.svg');
}


// 64930606 