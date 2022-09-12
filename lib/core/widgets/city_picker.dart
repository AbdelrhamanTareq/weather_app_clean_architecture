import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CityPicker extends StatelessWidget {
  const CityPicker({
    Key? key,
    this.onStateChanged,
    this.onCountryChanged,
  }) : super(key: key);

  final void Function(String?)? onStateChanged;
  final void Function(String?)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      layout: Layout.horizontal,
      onStateChanged: onStateChanged,
      onCountryChanged: onCountryChanged,
      onCityChanged: (value) {},
      showCities: false,
    );
  }
}
