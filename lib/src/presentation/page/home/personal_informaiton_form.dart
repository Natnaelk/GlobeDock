import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class PersonalInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
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
                SizedBox(
                  height: SPACE20,
                ),
                FormBuilderTextField(
                  name: 'fathersname',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Fathers Name',
                          style: Theme.of(context).textTheme.titleMedium),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(RADIUS),
                          borderSide: BorderSide(
                              color: Theme.of(context).disabledColor))),
                ),
                SizedBox(
                  height: SPACE20,
                ),
                FormBuilderTextField(
                  name: 'grandfathersname',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Grand Fathers Name',
                          style: Theme.of(context).textTheme.titleMedium),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(RADIUS),
                          borderSide: BorderSide(
                              color: Theme.of(context).disabledColor))),
                ),
                SizedBox(
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
                          child: Text('Male'),
                        )),
                    DropdownMenuItem<String>(
                        value: 'Female',
                        child: Container(
                          child: Text('Female'),
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
                SizedBox(
                  height: SPACE20,
                ),
                CSCPicker(
                  showStates: false,
                  showCities: false,
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
                      border:
                          Border.all(color: Theme.of(context).disabledColor)),
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {},
                ),
                SizedBox(
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
                        value: 'single',
                        child: Container(
                          child: Text('Single'),
                        )),
                    DropdownMenuItem<String>(
                        value: 'married',
                        child: Container(
                          child: Text('Married'),
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
                SizedBox(
                  height: SPACE20,
                ),
                CSCPicker(
                  showStates: false,
                  showCities: false,
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
                      border:
                          Border.all(color: Theme.of(context).disabledColor)),
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {},
                ),
                SizedBox(
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
                        value: 'yes',
                        child: Container(
                          child: Text('Yes'),
                        )),
                    DropdownMenuItem<String>(
                        value: 'no',
                        child: Container(
                          child: Text('No'),
                        )),
                  ],
                  name: 'disability',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  isExpanded: true,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Do you have disability of impairment',
                          style: Theme.of(context).textTheme.titleMedium),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(RADIUS),
                          borderSide: BorderSide(
                              color: Theme.of(context).disabledColor))),
                ),
                SizedBox(
                  height: SPACE20,
                ),
                Row(
                  children: [
                    Text(
                      'Do you have a valid passport?',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(children: [Text('Yes')]),
                SizedBox(
                  height: SPACE20,
                ),
                FormBuilderDateTimePicker(
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
                          padding: const EdgeInsetsDirectional.only(end: 12.0),
                          child: SvgPicture.asset(
                            CustomIcons.DATE,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      focusColor: Colors.black,
                      label: Text('Valid Till (Select Date Calender)',
                          style: Theme.of(context).textTheme.titleMedium),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(RADIUS),
                          borderSide: BorderSide(
                              color: Theme.of(context).disabledColor))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.radio_button_unchecked,
                          color: Theme.of(context).disabledColor,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'No',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                FormBuilderDropdown(
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
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  isExpanded: true,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('First Language',
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
      ),
    );
  }
}
