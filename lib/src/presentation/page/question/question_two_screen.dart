import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/question/question_three_screen.dart';
import 'package:globedock/src/presentation/page/question/question_four_screen.dart';
import 'package:globedock/src/presentation/widget/country_tile.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class QuestionTwoWidget extends StatefulWidget {
  const QuestionTwoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionTwoWidget> createState() => _QuestionTwoWidgetState();
}

class _QuestionTwoWidgetState extends State<QuestionTwoWidget> {
  List<String> selectedCountries = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).dialogBackgroundColor,
                    onPressed: () => GoRouter.of(context).goNamed(
                        AppRoutes.QUESTION_ROUTE_NAME,
                        queryParameters: {'questionNumber': '1'}),
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
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Images.QUESTION_TWO),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DESTINATION_PREFERENCE,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SMALL_PADDING.w),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (selectedCountries.contains(countries[index].name)) {
                          setState(() {
                            selectedCountries.remove(countries[index].name);
                          });
                        } else {
                          setState(() {
                            selectedCountries.add(countries[index].name);
                          });
                        }
                      },
                      child: CountryTile(
                        country: countries[index],
                        backgroundColor:
                            selectedCountries.contains(countries[index].name)
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).cardColor,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SMALL_PADDING.w),
              child: CustomElevatedButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionThreeScreen())),
                label: 'Continue',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
