import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
          ),
          onPressed: () =>
              GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              deleteUserAlertDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: MAIN_PADDING),
              child: SvgPicture.asset(
                CustomIcons.DELETE,
                color: Theme.of(context).dialogBackgroundColor,
              ),
            ),
          )
        ],
        title: Text(
          "Account Settings",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: MAIN_PADDING,
            right: MAIN_PADDING,
            top: MAIN_PADDING * 1.5,
          ),
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(
                  left: MAIN_PADDING,
                  right: MAIN_PADDING,
                  top: MAIN_PADDING * 1.3,
                  bottom: MAIN_PADDING * 1.3,
                ),
                width: double.infinity,
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
                  borderRadius: BorderRadius.circular(RADIUS),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              child: CustomImage(
                                height: 55.h,
                                width: 55.h,
                                fit: BoxFit.cover,
                                image: 'hello',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 5),
                                child: SizedBox(
                                  height: 30.h,
                                  width: 20.h,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    child: SvgPicture.asset(
                                      CustomIcons.EDIT,
                                      height: 30.h,
                                      width: 20.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abel Belay',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5)),
                          child: Text(
                            'Enrolled students',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: CustomFontSize.s10),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 30.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RADIUS),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(MAIN_PADDING),
                child: Column(children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context)
                        .go(AppRoutes.UPLOAD_DOCUMENTS_ROUTE_PATH),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile Completion',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  '60% completed',
                                  style: TextStyle(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: CustomFontSize.s10),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: SPACE10,
                        ),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 50,
                          size: 12,
                          padding: 0,
                          selectedColor: Theme.of(context).primaryColor,
                          unselectedColor: Theme.of(context).primaryColorLight,
                          roundedEdges: const Radius.circular(RADIUS),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RADIUS),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(MAIN_PADDING),
                child: Column(children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account',
                              style: TextStyle(fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return editProfileBottomSheet();
                                    });
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    CustomIcons.EDIT,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: SPACE40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Images.EMAIL_LOGIN,
                              width: 20,
                              height: 20,
                              color: Theme.of(context).dialogBackgroundColor,
                            ),
                            Text('Abel@gmail.com',
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(
                          height: SPACE40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              CustomIcons.CALL,
                              width: 20,
                              height: 20,
                              color: Theme.of(context).dialogBackgroundColor,
                            ),
                            Text('0922378272', style: TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(
                          height: SPACE40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              CustomIcons.LOCATION,
                              width: 20,
                              height: 20,
                            ),
                            Text('locaiton not added',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).disabledColor))
                          ],
                        ),
                        const SizedBox(
                          height: SPACE40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              CustomIcons.GENDER,
                              width: 20,
                              height: 20,
                            ),
                            Text('Male', style: TextStyle(fontSize: 15))
                          ],
                        ),
                        const SizedBox(
                          height: SPACE40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              CustomIcons.CAKE,
                              width: 20,
                              height: 20,
                            ),
                            Text('00-00-2023', style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

deleteUserAlertDialog(BuildContext context) async {
  return await showAdaptiveDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text('Delete Account'),
        content: const Text('Are you sure you want to delete your account?'),
        actions: [
          ElevatedButton(
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ColorLight.alert),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    StadiumBorder(side: BorderSide.none)),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              // action on pressed
            },
          ),
          ElevatedButton(
            child: Text(
              'No',
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ColorLight.alert),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    StadiumBorder(side: BorderSide.none)),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              Navigator.of(context).pop();
              // action on pressed
            },
          ),
        ],
      );
    },
  );
}

Widget editProfileBottomSheet() {
  String _selectedValue;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.only(
            left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING * 1.3),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: FormBuilder(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: SPACE40,
                    ),
                    FormBuilderTextField(
                      name: 'firstname',
                      onChanged: (val) {
                        print(val);
                      },
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          label: Text('First Name',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    ),
                    const SizedBox(
                      height: SPACE20,
                    ),
                    FormBuilderTextField(
                      name: 'lastname',
                      onChanged: (val) {
                        print(val);
                      },
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          label: Text('Last Name',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    ),
                    const SizedBox(
                      height: SPACE20,
                    ),
                    FormBuilderDropdown(
                      elevation: 0,
                      icon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: SvgPicture.asset(
                          CustomIcons.ARROW_DOWN,
                        ),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'aa',
                            child: Container(
                              child: const Text('Addis Ababa'),
                            )),
                        DropdownMenuItem<String>(
                            value: 'hawassa',
                            child: Container(
                              child: const Text('Hawassa'),
                            )),
                      ],
                      name: 'gender',
                      onChanged: (val) {
                        print(val);
                      },
                      style: Theme.of(context).textTheme.bodyMedium,
                      isExpanded: true,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          label: Text('Addis Ababa',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    ),
                    const SizedBox(
                      height: SPACE20,
                    ),
                    FormBuilderDropdown(
                      elevation: 0,
                      icon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: SvgPicture.asset(
                          CustomIcons.ARROW_DOWN,
                        ),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Male',
                            child: Container(
                              child: const Text('Male'),
                            )),
                        DropdownMenuItem<String>(
                            value: 'Female',
                            child: Container(
                              child: const Text('Female'),
                            )),
                      ],
                      name: 'gender',
                      onChanged: (val) {
                        print(val);
                      },
                      style: Theme.of(context).textTheme.bodyMedium,
                      isExpanded: true,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          label: Text('Male',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    ),
                    const SizedBox(
                      height: SPACE20,
                    ),
                    FormBuilderDateTimePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      name: 'dob',
                      onChanged: (val) {
                        print(val);
                      },
                      timePickerInitialEntryMode: TimePickerEntryMode.inputOnly,
                      style: Theme.of(context).textTheme.bodyMedium,
                      inputType: InputType.date,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.zero,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              child: SvgPicture.asset(
                                CustomIcons.DATE,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          focusColor: Colors.black,
                          label: Text('Date Of Birth',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    ),
                    const SizedBox(
                      height: SPACE20,
                    ),
                    const SizedBox(height: MAIN_PADDING),
                    CustomElevatedButton(
                      onTap: () {},
                      label: 'Continue',
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: MAIN_PADDING * 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
