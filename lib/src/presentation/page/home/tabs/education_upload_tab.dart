import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class EducationUploadTab extends StatefulWidget {
  const EducationUploadTab({Key? key}) : super(key: key);

  @override
  State<EducationUploadTab> createState() => _EducationUploadTabState();
}

class _EducationUploadTabState extends State<EducationUploadTab> {
  bool pursuingSecondaryEducation = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Completed or pursuing my secondary education ',
                style: Theme.of(context).textTheme.titleSmall,
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
            initialValue: pursuingSecondaryEducation,
            onChanged: (value) {
              setState(() {
                pursuingSecondaryEducation =
                    value == 'Yes'; // Simplified assignment
              });
            },
          ),
          pursuingSecondaryEducation
              ? UploadDocumentWidget(
                  labelString: 'Highshool Diploma*',
                )
              : SizedBox(),
          SizedBox(height: SPACE20),
          Row(
            children: [
              Text(
                'Completed or pursuing my bachelor\'s degree',
                style: Theme.of(context).textTheme.titleSmall,
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
          const SizedBox(
            height: SPACE20,
          ),
          Row(
            children: [
              Text(
                'Completed or pursuing my master\'s degree',
                style: Theme.of(context).textTheme.titleSmall,
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
