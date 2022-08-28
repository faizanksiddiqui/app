import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key, this.color = Colors.black}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 15,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: const Divider(
              thickness: 2,
            ),
          ),
        ),
        SizedBox(
          height: 15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              double size = index == 1 ? 12 : 8;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
