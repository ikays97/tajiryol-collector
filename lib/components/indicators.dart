import 'package:flutter/material.dart';

class ProgressIndicatorSmall extends StatelessWidget {
  const ProgressIndicatorSmall();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.0,
      height: 22.0,
      child: CircularProgressIndicator(strokeWidth: 2.5),
    );
  }
}
