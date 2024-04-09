import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class PersonalInfoTab extends StatefulWidget {
  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  String currentCountry = 'Birth country';
  bool haveValidPassport = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'firstname',
                onChanged: (val) {
                  print(val);
                },
                autovalidateMode: AutovalidateMode.always,
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
                name: 'fathersname',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Father\'s Name',
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
                name: 'grandfathersname',
                onChanged: (val) {
                  print(val);
                },
                autovalidateMode: AutovalidateMode.always,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Grand Father\'s Name',
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
                autovalidateMode: AutovalidateMode.always,
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
                    label: Text('Gender',
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
                autovalidateMode: AutovalidateMode.always,
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
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
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
                currentCountry: currentCountry,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  setState(() {
                    currentCountry = value;
                  });
                },
                countryDropdownLabel: 'Birth country',
              ),
              const SizedBox(
                height: SPACE20,
              ),
              FormBuilderDropdown(
                autovalidateMode: AutovalidateMode.always,
                elevation: 0,
                icon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: SvgPicture.asset(
                    CustomIcons.ARROW_DOWN,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                      value: 'single',
                      child: Container(
                        child: const Text('Single'),
                      )),
                  DropdownMenuItem<String>(
                      value: 'married',
                      child: Container(
                        child: const Text('Married'),
                      )),
                ],
                name: 'maritialstatus',
                onChanged: (val) {
                  print(val);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Maritital Status',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
              const SizedBox(
                height: SPACE20,
              ),
              // FormBuilderDropdown(
              //   autovalidateMode: AutovalidateMode.always,
              //   elevation: 0,
              //   icon: Padding(
              //     padding: const EdgeInsetsDirectional.only(end: 12.0),
              //     child: SvgPicture.asset(
              //       CustomIcons.ARROW_DOWN,
              //     ),
              //   ),
              //   items: [
              //     DropdownMenuItem<String>(
              //         value: 'yes',
              //         child: Container(
              //           child: const Text('Yes'),
              //         )),
              //     DropdownMenuItem<String>(
              //         value: 'no',
              //         child: Container(
              //           child: const Text('No'),
              //         )),
              //   ],
              //   name: 'disability',
              //   onChanged: (val) {
              //     print(val);
              //   },
              //   style: Theme.of(context).textTheme.bodyMedium,
              //   isExpanded: true,
              //   decoration: InputDecoration(
              //       focusColor: Colors.black,
              //       label: Text('Do you have disability of impairment',
              //           style: Theme.of(context).textTheme.titleMedium),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(RADIUS),
              //           borderSide: BorderSide(
              //               color: Theme.of(context).disabledColor))),
              // ),
              // const SizedBox(
              //   height: SPACE20,
              // ),
              Row(
                children: [
                  Text(
                    'Do you have a valid passport?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),

              const SizedBox(
                height: SPACE10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          haveValidPassport = true;
                        });
                      },
                      icon: Icon(
                        haveValidPassport
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: Theme.of(context).disabledColor,
                      )),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Yes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          haveValidPassport = false;
                        });
                      },
                      icon: Icon(
                        !haveValidPassport
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: Theme.of(context).disabledColor,
                      )),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'No',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              const SizedBox(
                height: SPACE10,
              ),
              haveValidPassport
                  ? FormBuilderDateTimePicker(
                      autovalidateMode: AutovalidateMode.always,
                      initialDatePickerMode: DatePickerMode.day,
                      name: 'passportvaliddate',
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
                          label: Text('Expiry Date (Select Date Calender)',
                              style: Theme.of(context).textTheme.titleMedium),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(RADIUS),
                              borderSide: BorderSide(
                                  color: Theme.of(context).disabledColor))),
                    )
                  : SizedBox(),
              haveValidPassport
                  ? const SizedBox(
                      height: SPACE20,
                    )
                  : SizedBox(),
              FormBuilderDropdown(
                autovalidateMode: AutovalidateMode.always,
                elevation: 0,
                icon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: SvgPicture.asset(
                    CustomIcons.ARROW_DOWN,
                  ),
                ),
                items: languages.entries
                    .map((entry) => DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.value),
                        ))
                    .toList(),
                name: 'firstlanguage',
                onChanged: (val) {},
                style: Theme.of(context).textTheme.bodyMedium,
                isExpanded: true,
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    label: Text('Mother Tongue',
                        style: Theme.of(context).textTheme.titleMedium),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        borderSide: BorderSide(
                            color: Theme.of(context).disabledColor))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
