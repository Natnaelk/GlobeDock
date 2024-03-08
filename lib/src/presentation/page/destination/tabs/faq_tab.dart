import 'package:flutter/material.dart';
import 'package:globedock/src/common/constant.dart';

class FAQTab extends StatelessWidget {
  const FAQTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(RADIUS_SMALL),
              ),
              child: ExpansionTile(
                title: Text(
                  'Expenses & Cost of living',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                shape: Border.all(color: Theme.of(context).bottomAppBarColor),
                collapsedBackgroundColor: Theme.of(context).cardColor,
                childrenPadding: EdgeInsets.all(8.0),
                children: [
                  Text(
                    'Expenses & Cost of living' * 5,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
