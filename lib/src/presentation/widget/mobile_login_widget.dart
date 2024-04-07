import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/country_picker_widget.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class MobileLoginTab extends StatefulWidget {
  const MobileLoginTab({Key? key}) : super(key: key);

  @override
  State<MobileLoginTab> createState() => _MobileLoginTabState();
}

class _MobileLoginTabState extends State<MobileLoginTab> {
  @override
  String? _countryDialCode;
  void initState() {
    _countryDialCode = '+251';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              width: 95.w,
              height: 35.h,
              isWidget: true,
              childWidget: CodePickerWidget(
                alignLeft: true,
                onChanged: (CountryCode countryCode) {
                  setState(() {
                    _countryDialCode = countryCode.dialCode;
                  });
                },
                initialSelection: 'ET',
                favorite: [_countryDialCode!],
                flagDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                showCountryOnly: true,
                showDropDownButton: true,
                backgroundColor: Colors.white,
                flagWidth: 30,
                hideMainText: true,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: CustomTextField(
              width: double.infinity,
              height: 35.h,
              labelText: 'Mobile number',
            )),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        CustomElevatedButton(
          onTap: () => GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
          label: SEND_OTP,
        ),
      ],
    );
  }
}
