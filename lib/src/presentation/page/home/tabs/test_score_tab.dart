import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class TestScoreTab extends StatefulWidget {
  @override
  State<TestScoreTab> createState() => _TestScoreTabState();
}

class _TestScoreTabState extends State<TestScoreTab> {
  bool examTaken = false;
  bool satTaken = false;
  bool greTaken = false;
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
                    'Have you taken any International Exam?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              FormBuilderRadioGroup(
                name: 'proficiency_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    examTaken = value == 'Yes'; // Simplified assignment
                  });
                },
                options: ['Yes', 'No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
                initialValue: examTaken
                    ? 'Yes'
                    : 'No', // Set initial value based on examTaken
              ),
              examTaken
                  ? Column(
                      children: [
                        FormBuilderDropdown(
                          elevation: 0,
                          icon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
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
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(RADIUS),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).disabledColor))),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormBuilderTextField(
                          name: 'score',
                          onChanged: (val) {
                            print(val);
                          },
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              focusColor: Colors.black,
                              label: Text('Your Score',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(RADIUS),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).disabledColor))),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormBuilderDateTimePicker(
                          initialDatePickerMode: DatePickerMode.day,
                          name: 'test_taken_date',
                          onChanged: (val) {
                            print(val);
                          },
                          timePickerInitialEntryMode:
                              TimePickerEntryMode.inputOnly,
                          style: Theme.of(context).textTheme.bodyMedium,
                          inputType: InputType.date,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  child: SvgPicture.asset(
                                    CustomIcons.DATE,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              focusColor: Colors.black,
                              label: Text('Test Taken Date',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(RADIUS),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).disabledColor))),
                        ),
                      ],
                    )
                  : SizedBox(),
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
              FormBuilderRadioGroup(
                name: 'sat_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    satTaken = value == 'Yes'; // Simplified assignment
                  });
                },
                options: ['Yes', 'No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
                initialValue: satTaken
                    ? 'Yes'
                    : 'No', // Set initial value based on examTaken
              ),
              SizedBox(
                height: 10.h,
              ),
              satTaken
                  ? FormBuilderDateTimePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      name: 'sat_test_taken_date',
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
                          label: Text('Test Taken Date',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    )
                  : SizedBox(),
              const SizedBox(
                height: SPACE20,
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
              FormBuilderRadioGroup(
                name: 'gre_proficiency_test',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    greTaken = value == 'Yes'; // Simplified assignment
                  });
                },
                options: ['Yes', 'No']
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
                initialValue: greTaken
                    ? 'Yes'
                    : 'No', // Set initial value based on examTaken
              ),
              SizedBox(
                height: 10.h,
              ),
              greTaken
                  ? FormBuilderDateTimePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      name: 'gre_test_taken_date',
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
                          label: Text('Test Taken Date',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    )
                  : SizedBox()
            ]))
      ]),
    );
  }
}
