import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class AddressTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FormBuilder(
          key: _formKey,
          child: Column(children: [
            CSCPicker(
              showStates: false,
              showCities: false,
              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
              dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(RADIUS)),
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
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
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
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
            ),
            const SizedBox(
              height: SPACE20,
            ),
            FormBuilderTextField(
              name: 'subcity',
              onChanged: (val) {
                print(val);
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  label: Text('Sub City',
                      style: Theme.of(context).textTheme.titleMedium),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(RADIUS),
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
            ),
            const SizedBox(
              height: SPACE20,
            ),
            FormBuilderTextField(
              name: 'woreda',
              onChanged: (val) {
                print(val);
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  label: Text('Woreda',
                      style: Theme.of(context).textTheme.titleMedium),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(RADIUS),
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
            ),
            const SizedBox(
              height: SPACE20,
            ),
            FormBuilderTextField(
              name: 'housenumber',
              onChanged: (val) {
                print(val);
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  label: Text('House Number',
                      style: Theme.of(context).textTheme.titleMedium),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(RADIUS),
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
            ),
            const SizedBox(
              height: SPACE20,
            ),
          ]))
    ]);
  }
}
