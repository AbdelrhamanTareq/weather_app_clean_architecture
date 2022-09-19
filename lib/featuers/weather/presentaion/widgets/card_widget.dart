import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.data,
    required this.title,
    required this.iconOrAsset,
  }) : super(key: key);

  final String title;
  final String data;
  final Widget iconOrAsset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Text(
                data,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              iconOrAsset
            ],
          )),
    );
  }
}
