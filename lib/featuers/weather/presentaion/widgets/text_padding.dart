// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextPadding extends StatelessWidget {
  final String _text;
  final double _fontSize;
  final Color? _color;
  final FontWeight _fontWeight;
  final double _top;
  final double _bottom;
  final double _left;
  final double _right;
  const TextPadding({
    Key? key,
    required String text,
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? top,
    double? bottom,
    double? left,
    double? right,
  })  : _fontSize = fontSize,
        _text = text,
        _color = color ?? Colors.white,
        _fontWeight = fontWeight ?? FontWeight.normal,
        _bottom = bottom ?? 0,
        _top = top ?? 0,
        _left = left ?? 0,
        _right = right ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _top, left: _left, right: _right, bottom: _bottom),
      child: Text(
        _text,
        style: TextStyle(
            fontSize: _fontSize, color: _color, fontWeight: _fontWeight),
      ),
    );
  }
}
