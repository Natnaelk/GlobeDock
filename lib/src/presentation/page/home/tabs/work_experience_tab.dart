import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class WorkExperience extends StatefulWidget {
  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  bool hasWorkExperience = false;
  bool currentlyWorkingHere = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FormBuilder(
                key: _formKey,
                child: Column(children: [
                  FormBuilderRadioGroup(
                    name: 'gre_proficiency_test',
                    separator: const SizedBox(),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        hasWorkExperience =
                            value == 'Yes'; // Simplified assignment
                      });
                    },
                    options: ['Yes', 'No']
                        .map((lang) => FormBuilderFieldOption(value: lang))
                        .toList(growable: false),
                    initialValue: hasWorkExperience
                        ? 'Yes'
                        : 'No', // Set initial value based on examTaken
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  hasWorkExperience
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
                                    value: 'sample_one',
                                    child: Container(
                                      child: const Text('Sample 1'),
                                    )),
                                DropdownMenuItem<String>(
                                    value: 'sample_two',
                                    child: Container(
                                      child: const Text('Sample 2'),
                                    )),
                              ],
                              name: 'work_type',
                              onChanged: (val) {
                                print(val);
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              isExpanded: true,
                              decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  label: Text('Work Type',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .disabledColor))),
                            ),
                            const SizedBox(
                              height: SPACE20,
                            ),
                            FormBuilderTextField(
                              name: 'name_of_org',
                              onChanged: (val) {
                                print(val);
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  label: Text('Name Of Organization',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .disabledColor))),
                            ),
                            const SizedBox(
                              height: SPACE20,
                            ),
                            FormBuilderTextField(
                              name: 'role',
                              onChanged: (val) {
                                print(val);
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  label: Text('Job Position',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .disabledColor))),
                            ),
                            const SizedBox(
                              height: SPACE20,
                            ),
                            FormBuilderDateTimePicker(
                              initialDatePickerMode: DatePickerMode.day,
                              name: 'started_on',
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
                                  label: Text('Started On',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .disabledColor))),
                            ),
                            FormBuilderCheckbox(
                              name: 'currentlyworkinghere',
                              title: Text('I currently work here'),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentlyWorkingHere = value!;
                                });
                              },
                              initialValue: currentlyWorkingHere ? true : false,
                            ),
                            !currentlyWorkingHere
                                ? FormBuilderDateTimePicker(
                                    initialDatePickerMode: DatePickerMode.day,
                                    name: 'ended_on',
                                    onChanged: (val) {
                                      print(val);
                                    },
                                    timePickerInitialEntryMode:
                                        TimePickerEntryMode.inputOnly,
                                    inputType: InputType.date,
                                    decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.zero,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 12.0),
                                            child: SvgPicture.asset(
                                              CustomIcons.DATE,
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        ),
                                        focusColor: Colors.black,
                                        label: Text('Ended On',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(RADIUS),
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .disabledColor))),
                                  )
                                : SizedBox(),
                            const SizedBox(
                              height: SPACE20,
                            ),
                            FormBuilderTextField(
                              name: 'city',
                              onChanged: (val) {
                                print(val);
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  label: Text('City / Town',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .disabledColor))),
                            ),
                            const SizedBox(
                              height: SPACE20,
                            ),
                            CSCPicker(
                              showStates: false,
                              showCities: false,
                              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(RADIUS)),
                                  border: Border.all(
                                      color: Theme.of(context).disabledColor)),
                              selectedItemStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              dropdownHeadingStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              dropdownItemStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              searchBarRadius: 10.0,
                              onCountryChanged: (value) {},
                            ),
                          ],
                        )
                      : SizedBox()
                ]))
          ]),
        ],
      ),
    );
  }
}
