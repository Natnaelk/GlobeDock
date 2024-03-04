import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';

class FamilyTab extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                value: 'mother',
                child: Container(
                  child: const Text('Mother'),
                )),
            DropdownMenuItem<String>(
                value: 'father',
                child: Container(
                  child: const Text('Father'),
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
              label: Text('Relationship',
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
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
        const SizedBox(
          height: SPACE20,
        ),
        FormBuilderTextField(
          name: 'Fathers Name',
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
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
        const SizedBox(
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
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
        const SizedBox(
          height: SPACE20,
        ),
        FormBuilderTextField(
          keyboardType: TextInputType.phone,
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
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
        const SizedBox(
          height: SPACE20,
        ),
        FormBuilderTextField(
          keyboardType: TextInputType.emailAddress,
          name: 'email',
          onChanged: (val) {
            print(val);
          },
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              focusColor: Colors.black,
              label:
                  Text('Email', style: Theme.of(context).textTheme.titleMedium),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RADIUS),
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
        const SizedBox(
          height: SPACE20,
        ),
        FormBuilderTextField(
          keyboardType: TextInputType.none,
          name: 'jobtitle',
          onChanged: (val) {
            print(val);
          },
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              focusColor: Colors.black,
              label: Text('Job Title',
                  style: Theme.of(context).textTheme.titleMedium),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RADIUS),
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
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
                value: 'bsc',
                child: Container(
                  child: const Text('BSC'),
                )),
            DropdownMenuItem<String>(
                value: 'ba',
                child: Container(
                  child: const Text('BA'),
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
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor))),
        ),
      ]),
    );
  }
}
