import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class TestScoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FormBuilder(
            key: _formKey,
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'Have you taken any engilsh proficiency test?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(children: const [Text('Yes')]),
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
                      value: 'ielts',
                      child: Container(
                        child: const Text('IELTS'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'tofel',
                      child: Container(
                        child: const Text('TOFEL'),
                      )),
                ],
                name: 'select_test',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Select your test',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              FormBuilderRadioGroup(
                name: 'proficiency_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                options: ['No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              FormBuilderDateTimePicker(
                initialDatePickerMode: DatePickerMode.day,
                name: 'test_taken_date',
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
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: SvgPicture.asset(
                          CustomIcons.DATE,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    focusColor: Colors.black,
                    label: Text('Test Taken Date',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              const SizedBox(
                height: SPACE20,
              ),
              Row(
                children: [
                  Text(
                    'Have you taken any SAT / ACT?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(children: const [Text('Yes')]),
              const SizedBox(
                height: SPACE20,
              ),
              FormBuilderDateTimePicker(
                initialDatePickerMode: DatePickerMode.day,
                name: 'test_taken_date',
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
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: SvgPicture.asset(
                          CustomIcons.DATE,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    focusColor: Colors.black,
                    label: Text('Test Taken Date',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              const SizedBox(
                height: SPACE20,
              ),
              FormBuilderRadioGroup(
                name: 'proficiency_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                options: ['No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
              Row(
                children: [
                  Text(
                    'Have you taken any GRE / GMAT?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(children: const [Text('Yes')]),
              const SizedBox(
                height: SPACE20,
              ),
              FormBuilderDateTimePicker(
                initialDatePickerMode: DatePickerMode.day,
                name: 'test_taken_date',
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
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: SvgPicture.asset(
                          CustomIcons.DATE,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    focusColor: Colors.black,
                    label: Text('Test Taken Date',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              FormBuilderRadioGroup(
                name: 'proficiency_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                options: ['No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
              ),
            ]))
      ]),
    );
  }
}
