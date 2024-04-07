import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class SupportingDocumentsUploadTab extends StatefulWidget {
  const SupportingDocumentsUploadTab({Key? key}) : super(key: key);

  @override
  State<SupportingDocumentsUploadTab> createState() =>
      _SupportingDocumentsUploadTabState();
}

class _SupportingDocumentsUploadTabState
    extends State<SupportingDocumentsUploadTab> {
  bool iHaveCv = false;
  bool iHavePersonalEssay = false;
  bool iHaveExtraCurricular = false;
  bool iHaveRecommendation = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'I have CV(Curriculum Vitae)',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          FormBuilderRadioGroup(
            name: 'ihavecv',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              setState(() {
                iHaveCv = value == 'Yes';
              });
            },
            initialValue: iHaveCv ? true : false,
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHaveCv
              ? UploadDocumentWidget(
                  labelString: 'Cv (Curriculum Vitae)',
                )
              : SizedBox(),
          iHaveCv ? SizedBox(height: SPACE20) : SizedBox(),
          Row(
            children: [
              Text(
                'I have Personal Essay',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          FormBuilderRadioGroup(
            name: 'ihaveessay',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              setState(() {
                iHavePersonalEssay = value == 'Yes';
              });
            },
            initialValue: iHavePersonalEssay ? true : false,
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHavePersonalEssay
              ? UploadDocumentWidget(
                  labelString: 'Essay',
                )
              : SizedBox(),
          iHavePersonalEssay ? SizedBox(height: SPACE20) : SizedBox(),
          Row(
            children: [
              Text(
                'I have Extra-Curricular',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          FormBuilderRadioGroup(
            name: 'ihaveextracurricular',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              setState(() {
                iHaveExtraCurricular = value == 'Yes';
              });
            },
            initialValue: iHaveExtraCurricular ? true : false,
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHaveExtraCurricular
              ? UploadDocumentWidget(
                  labelString: 'Extra-Curricular',
                )
              : SizedBox(),
          iHaveExtraCurricular ? SizedBox(height: SPACE20) : SizedBox(),
          Row(
            children: [
              Text(
                'I have Recommendation',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          FormBuilderRadioGroup(
            name: 'ihaverecommendation',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              setState(() {
                iHaveRecommendation = value == 'Yes';
              });
            },
            initialValue: iHaveRecommendation ? true : false,
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHaveRecommendation
              ? UploadDocumentWidget(
                  labelString: 'Recommendation',
                )
              : SizedBox(),
          iHaveRecommendation ? SizedBox(height: SPACE20) : SizedBox(),
        ],
      ),
    );
  }
}
