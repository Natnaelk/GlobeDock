import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class EducationTab extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Text('Mandatory / required*')]),
        SizedBox(
          height: 10.h,
        ),
        FormBuilder(
            key: _formKey,
            child: Column(children: [
              FormBuilderDropdown(
                dropdownColor: Theme.of(context).cardColor,
                elevation: 0,
                icon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: SvgPicture.asset(
                    CustomIcons.ARROW_DOWN,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                      value: 'middleschoolcompleted',
                      child: Container(
                        child: const Text(
                            'Middle School Completed (8th Grade Ministry)'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'highscoolincomplete',
                      child: Container(
                        child: const Text('Highschool Incomplete'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'highschooldiploma',
                      child: Container(
                        child: const Text('Highschool Diploma'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'bsc',
                      child: Container(
                        child: const Text('Bachelor\'s Degree'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'mastersorabove',
                      child: Container(
                        child: const Text('Master\'s Degree and Above'),
                      )),
                ],
                name: 'highestqualification',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Select Highest Qualification',
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
                    'Education Status*',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              FormBuilderRadioGroup(
                name: 'educationstatus',
                separator: const SizedBox(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                options: [
                  'Currently Studying',
                  'Completed',
                ]
                    .map((lang) => FormBuilderFieldOption(value: lang))
                    .toList(growable: false),
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
                      value: 'gpa',
                      child: Container(
                        child: const Text('GPA'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'mark',
                      child: Container(
                        child: const Text('Mark'),
                      )),
                ],
                name: 'gradescheme',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Grade Scheme(GPA / Percentage)',
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
                name: 'grade',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Average Grade / Average Mark Obtained',
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
                name: 'name_of_institiution',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Name of Institution (School / University)',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              const SizedBox(
                height: SPACE20,
              ),
              CSCPicker(
                showStates: false,
                showCities: false,
                flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                dropdownDecoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(RADIUS)),
                    border: Border.all(color: Theme.of(context).disabledColor)),
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
              const SizedBox(
                height: SPACE20,
              ),
              FormBuilderTextField(
                name: 'state',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('State / Province',
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
                      value: 'sample1r',
                      child: Container(
                        child: const Text('Sample 1'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'sample2',
                      child: Container(
                        child: const Text('Sample 2'),
                      )),
                ],
                name: 'state',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('State / Province',
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
                name: 'city',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('City / Town',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
            ]))
      ]),
    );
  }
}
