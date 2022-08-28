import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({Key? key, this.color = Colors.black}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(5, (_) {
            return SizedBox(
              width: 2,
              height: 6,
              child: Container(
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
