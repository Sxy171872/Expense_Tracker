import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({this.fill, this.total});

  final double fill;
  final double total;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Row(
        children: [
          //Text("$total"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FractionallySizedBox(
                heightFactor: fill,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.65),
                  ),
                  //child: Center(child: Text("$total")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
