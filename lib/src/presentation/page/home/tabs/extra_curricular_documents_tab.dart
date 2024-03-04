import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class ExtraCurricularDocumentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            FormBuilder(
                child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Activity Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                FormBuilderRadioGroup(
                  name: 'activity_status',
                  separator: const SizedBox(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  options: [
                    'Ongoing',
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
                        value: 'sample1',
                        child: Container(
                          child: const Text('Sample 1'),
                        )),
                    DropdownMenuItem<String>(
                        value: 'sample2',
                        child: Container(
                          child: const Text('Sample 2'),
                        )),
                  ],
                  name: 'select_activity',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  isExpanded: true,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Select Activity',
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
                  name: 'position_designation',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Position Designation',
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
                  name: 'started_on',
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
                      label: Text('Started On',
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
                  name: 'ended_on',
                  onChanged: (val) {
                    print(val);
                  },
                  timePickerInitialEntryMode: TimePickerEntryMode.inputOnly,
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
                      label: Text('Ended On',
                          style: Theme.of(context).textTheme.titleMedium),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(RADIUS),
                          borderSide: BorderSide(
                              color: Theme.of(context).disabledColor))),
                ),
                const SizedBox(
                  height: SPACE20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Would you be interested participating in similar activities at university where you apply?',
                      style: TextStyle(),
                      maxLines: 3,
                    ),
                  ],
                ),
                FormBuilderRadioGroup(
                  name: 'answer',
                  separator: const SizedBox(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  options: [
                    'Yes',
                    'No',
                  ]
                      .map((lang) => FormBuilderFieldOption(value: lang))
                      .toList(growable: false),
                ),
              ],
            ))
          ],
        ));
  }
}
