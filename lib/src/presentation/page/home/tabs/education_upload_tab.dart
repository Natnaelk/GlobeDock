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
  bool pursuingBachelors = false;
  bool pursuingMasters = false;
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
          SizedBox(height: !pursuingSecondaryEducation ? 0 : SPACE20),
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
            name: 'pursuingbachelors',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                pursuingBachelors = value == 'Yes'; // Simplified assignment
              });
            },
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          pursuingBachelors
              ? UploadDocumentWidget(
                  labelString: 'Undergraduate Degree Certificate',
                )
              : SizedBox(),
          SizedBox(height: pursuingBachelors ? SPACE20 : 0),
          pursuingBachelors
              ? UploadDocumentWidget(
                  labelString: 'Tempo',
                )
              : SizedBox(),
          SizedBox(height: pursuingBachelors ? SPACE20 : 0),
          pursuingBachelors
              ? UploadDocumentWidget(
                  labelString: 'Student Copy',
                )
              : SizedBox(),
          SizedBox(height: pursuingBachelors ? SPACE20 : 0),
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
            name: 'pursuingmasters',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                pursuingMasters = value == 'Yes'; // Simplified assignment
              });
            },
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          pursuingMasters
              ? UploadDocumentWidget(
                  labelString: 'Postgraduage Degree Certificate',
                )
              : SizedBox(),
          SizedBox(height: SPACE20),
          pursuingMasters
              ? UploadDocumentWidget(
                  labelString: 'Tempo',
                )
              : SizedBox(),
          SizedBox(height: SPACE20),
          pursuingMasters
              ? UploadDocumentWidget(
                  labelString: 'Student Copy',
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
