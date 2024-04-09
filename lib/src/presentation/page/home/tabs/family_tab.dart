import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';

class FamilyTab extends StatefulWidget {
  @override
  State<FamilyTab> createState() => _FamilyTabState();
}

class _FamilyTabState extends State<FamilyTab> {
  final _formKey = GlobalKey<FormBuilderState>();
  int itemIndex = 1;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(itemIndex);
    print(itemIndex - 1);
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: itemIndex,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return FamilyForm(
          firstTime: index == 0,
          lastTime: index == itemIndex - 1,
          onAddNewPressed: () {
            print('Tapped');
            setState(() {
              itemIndex++;
            });
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration:
                  Duration(milliseconds: 500), // Adjust the duration as needed
              curve: Curves.easeInOut, // Adjust the curve as needed
            );
          },
        );
      },
    );
  }
}

class FamilyForm extends StatelessWidget {
  const FamilyForm({
    Key? key,
    this.onAddNewPressed,
    this.firstTime,
    this.lastTime,
  }) : super(key: key);

  final VoidCallback? onAddNewPressed;
  final bool? firstTime;
  final bool? lastTime;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      firstTime! ? Row(children: [Text('Mandatory / required*')]) : SizedBox(),
      !firstTime! ? Divider() : SizedBox(),
      SizedBox(
        height: 10.h,
      ),
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
              value: 'mother',
              child: Container(
                child: const Text('Mother'),
              )),
          DropdownMenuItem<String>(
              value: 'father',
              child: Container(
                child: const Text('Father'),
              )),
          DropdownMenuItem<String>(
              value: 'brother',
              child: Container(
                child: const Text('Brother'),
              )),
          DropdownMenuItem<String>(
              value: 'sister',
              child: Container(
                child: const Text('Sister'),
              )),
          DropdownMenuItem<String>(
              value: 'guardian',
              child: Container(
                child: const Text('Guardian'),
              )),
          DropdownMenuItem<String>(
              value: 'husband',
              child: Container(
                child: const Text('Husband'),
              )),
          DropdownMenuItem<String>(
              value: 'wife',
              child: Container(
                child: const Text('Wife'),
              )),
          DropdownMenuItem<String>(
              value: 'son',
              child: Container(
                child: const Text('Son'),
              )),
          DropdownMenuItem<String>(
              value: 'daughter',
              child: Container(
                child: const Text('Daughter'),
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
            label: Text('Father\'s Name',
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
            label: Text('Grand Father\'s Name',
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
        cityDropdownLabel: 'Country of birth',
        stateDropdownLabel: 'Country of birth',
        countryDropdownLabel: 'Country of birth',
        dropdownHeadingStyle: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
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
        autovalidateMode: AutovalidateMode.always,
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
              value: 'entrepreneur',
              child: Container(
                child: const Text('Entrepreneur / self Employed'),
              )),
          DropdownMenuItem<String>(
              value: 'leadership',
              child: Container(
                child: const Text('Executive Leadership'),
              )),
          DropdownMenuItem<String>(
              value: 'professional',
              child: Container(
                child: const Text(
                    'Professional (e.g., Law, Medicine, Engineering)'),
              )),
          DropdownMenuItem<String>(
              value: 'skilledtrades',
              child: Container(
                child: const Text('Skilled Trades (e.g., Plumbing, Carpentry)'),
              )),
          DropdownMenuItem<String>(
              value: 'serviceindustry',
              child: Container(
                child:
                    const Text('Service Industry (e.g., Retail, Hospitality)'),
              )),
          DropdownMenuItem<String>(
              value: 'manufacturing',
              child: Container(
                child: const Text('Manufacturing and Labor'),
              )),
          DropdownMenuItem<String>(
              value: 'agriculture',
              child: Container(
                child: const Text('Agriculture and Farming'),
              )),
          DropdownMenuItem<String>(
              value: 'military',
              child: Container(
                child: const Text('Military and Defense'),
              )),
          DropdownMenuItem<String>(
              value: 'unemployed  ',
              child: Container(
                child: const Text('Unemployed'),
              )),
          DropdownMenuItem<String>(
              value: 'retired',
              child: Container(
                child: const Text('Retired'),
              )),
        ],
        name: 'occupation',
        onChanged: (val) {
          print(val);
        },
        style: Theme.of(context).textTheme.bodyMedium,
        isExpanded: true,
        decoration: InputDecoration(
            focusColor: Colors.black,
            label: Text('Occupation',
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
              value: 'mastersandabove',
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
                borderSide:
                    BorderSide(color: Theme.of(context).disabledColor))),
      ),
      SizedBox(
        height: 10.h,
      ),
      lastTime!
          ? GestureDetector(
              onTap: onAddNewPressed,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Add New+',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: CustomFontSize.s13))
              ]),
            )
          : SizedBox()
    ]);
  }
}
