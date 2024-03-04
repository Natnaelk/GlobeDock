import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';

class RecommendationsTab extends StatelessWidget {
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
                      'Reference Type',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                FormBuilderRadioGroup(
                  name: 'reference_type',
                  separator: const SizedBox(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  options: [
                    'Acedemic',
                    'Professional',
                  ]
                      .map((lang) => FormBuilderFieldOption(value: lang))
                      .toList(growable: false),
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
                  name: 'recommender_name',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Recommender Name',
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
                  name: 'contact_email',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Contact Email',
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
                  name: 'phonenumber',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Phone Number',
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
                  name: 'contactnumber',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Contact Number',
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
                  name: 'address_of_org',
                  onChanged: (val) {
                    print(val);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      label: Text('Address Of Organization / Institution',
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
                      'Do you have a letter of recommendation',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                FormBuilderRadioGroup(
                  name: 'recommendation_letter',
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
