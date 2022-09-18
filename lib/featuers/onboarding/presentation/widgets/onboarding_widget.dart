import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingWidget extends StatelessWidget {
  final String url;
  final String title;
  final String desc;

  const OnboardingWidget({
    Key? key,
    required this.url,
    required this.desc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SvgPicture.asset(
              url,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Container(
          //  width: 500,
            alignment: Alignment.center,
            child: Text(
              title,
              style:   TextStyle(color:  Colors.blue[800], fontSize: 33),
              textAlign: TextAlign.center,
              
            ),
          ),
        const  SizedBox(height: 20,),
          Container(
            width: 350,
            alignment: Alignment.center,
            child: Text(
              
              desc,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                color: Colors.grey[700],
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
