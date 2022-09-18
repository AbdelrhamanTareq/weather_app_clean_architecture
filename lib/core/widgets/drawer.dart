import 'package:flutter/material.dart';
import '../utils/app_strings.dart';
import 'city_picker.dart';

class Drawer extends StatelessWidget {
  const Drawer(
      {Key? key, this.onStateChanged, this.onCountryChanged, this.changeCity})
      : super(key: key);

  final void Function(String?)? onStateChanged;
  final void Function(String?)? onCountryChanged;
  final void Function()? changeCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 115, 129, 207),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppStrings.changeYourCountry,
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          CityPicker(
            onStateChanged:onStateChanged,
            onCountryChanged: onCountryChanged,
          ),
          Center(
            child: TextButton(
              child: Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "Change",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
              onPressed: changeCity ?? () {},
            ),
          )
        ],
      ),
    );
  }
}
