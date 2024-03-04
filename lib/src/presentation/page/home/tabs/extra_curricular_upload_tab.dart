import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExtraCurriuclarUploadTab extends StatelessWidget {
  const ExtraCurriuclarUploadTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'I have done Extra Curricular Activities',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 3,
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
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }
}
