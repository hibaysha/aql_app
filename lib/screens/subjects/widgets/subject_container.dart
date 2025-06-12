import 'package:aql_app/core_components/dx_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubjectContainer extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? image;

  const SubjectContainer({super.key, this.color, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            if (image != null) SvgPicture.asset(image!),
            const SizedBox(width: 20),
            if (text != null) DxText(text: text!, type: DxTextType.h6),
          ],
        ),
      ),
    );
  }
}
