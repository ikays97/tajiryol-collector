import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO:
class SvgIcons {
  SvgIcons._();
  // get 24dp svg
  static SvgPicture _svgAsset20dp(String assetPath) {
    return SvgPicture.asset(assetPath, width: 20, height: 20);
  }

  static Widget get checked => _svgAsset20dp('assets/icons/checked.svg');
  static Widget get cube => _svgAsset20dp('assets/icons/cube.svg');
  static Widget get invoiceNo => _svgAsset20dp('assets/icons/invoice_no.svg');
  static Widget get location => _svgAsset20dp('assets/icons/location.svg');
  static Widget get pricetags => _svgAsset20dp('assets/icons/pricetags.svg');
}
