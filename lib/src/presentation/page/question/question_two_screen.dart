import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/widget/country_tile.dart';
import 'package:go_router/go_router.dart';

class QuestionTwoWidget extends StatelessWidget {
  const QuestionTwoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Theme.of(context).dialogBackgroundColor,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4),
                child: Text(
                  'Question 2 of 4',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: CustomFontSize.s12,
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(Images.QUESTION_TWO)]),
        SizedBox(
          height: 30.h,
        ),
        Text(
          DESTINATION_PREFERENCE,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: SMALL_PADDING.w, right: SMALL_PADDING.w),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 15),
                shrinkWrap: true,
                itemCount: countries.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: SizedBox(
                        height: 70.h,
                        child: InkWell(
                            onTap: () => GoRouter.of(context).goNamed(
                                AppRoutes.QUESTION_ROUTE_NAME,
                                queryParameters: {'questionNumber': '3'}),
                            child: CountryTile(country: countries[index]))),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
