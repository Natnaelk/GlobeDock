import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class ExtraCurriuclarUploadTab extends StatefulWidget {
  const ExtraCurriuclarUploadTab({Key? key}) : super(key: key);

  @override
  State<ExtraCurriuclarUploadTab> createState() =>
      _ExtraCurriuclarUploadTabState();
}

class _ExtraCurriuclarUploadTabState extends State<ExtraCurriuclarUploadTab> {
  bool iHaveExtracurrcular = false;
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
            onChanged: (value) {
              setState(() {
                iHaveExtracurrcular = value == 'Yes';
              });
            },
            options: [
              'Yes',
              'No',
            ]
                .map((lang) => FormBuilderFieldOption(value: lang))
                .toList(growable: false),
          ),
          iHaveExtracurrcular
              ? UploadDocumentWidget(
                  labelString:
                      'Letter of certificate of your Extra Curricular Activity',
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
