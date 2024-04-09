import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class RecommendationUploadTab extends StatefulWidget {
  const RecommendationUploadTab({Key? key}) : super(key: key);

  @override
  State<RecommendationUploadTab> createState() =>
      _RecommendationUploadTabState();
}

class _RecommendationUploadTabState extends State<RecommendationUploadTab> {
  bool iHaveRecommendation = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'I have Recommendation Letter ',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 3,
              )
            ],
          ),
          FormBuilderRadioGroup(
            name: 'recommendation',
            separator: const SizedBox(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                iHaveRecommendation = value == 'Yes';
              });
            },
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHaveRecommendation
              ? UploadDocumentWidget(
                  labelString: 'Recommendation of teacher',
                )
              : SizedBox(),
          SizedBox(height: iHaveRecommendation ? SPACE20 : 0),
          iHaveRecommendation
              ? UploadDocumentWidget(
                  labelString: 'Recommendation of Director/Dein',
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
