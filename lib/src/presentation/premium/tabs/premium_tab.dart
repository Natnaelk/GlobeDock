import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';

class PremiumTab extends StatelessWidget {
  const PremiumTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RADIUS),
          border: Border.all(color: Theme.of(context).cardColor)),
      child: Column(
        children: [
          ListView.builder(
            itemCount: premiumPlansFeatures.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: MAIN_PADDING,
                    left: SMALL_PADDING,
                    right: SMALL_PADDING),
                child: Row(
                  children: [
                    SvgPicture.asset(index == 7 || index == 8
                        ? CustomIcons.UNCHECKED
                        : CustomIcons.CHECKED),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Text(
                        premiumPlansFeatures[index],
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: CustomFontSize.s13,
                            color: index == 7 || index == 8
                                ? Theme.of(context).disabledColor
                                : Theme.of(context).cardColor),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
