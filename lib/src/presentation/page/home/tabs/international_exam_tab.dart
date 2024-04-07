import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class InternationalExamTab extends StatefulWidget {
  const InternationalExamTab({Key? key}) : super(key: key);

  @override
  State<InternationalExamTab> createState() => _InternationalExamTabState();
}

class _InternationalExamTabState extends State<InternationalExamTab> {
  List<String> selectedChips = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'I have taken any English Proficiency Test',
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
          Container(
            alignment: Alignment.topLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: SPACE10, // Adjust spacing between chips
              runSpacing: SPACE10, // Adjust spacing between rows
              children: [
                for (var option in [
                  'IELTS',
                  'TOFEL',
                  'PTE',
                  'Duolingo',
                  'SAT',
                  'GMAT',
                  'GRE'
                ])
                  FilterChip(
                    showCheckmark: false,
                    label: Text(option),
                    selected: selectedChips.contains(option),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedChips.add(option);
                        } else {
                          selectedChips.remove(option);
                        }
                      });
                    },
                    selectedColor: Theme.of(context).primaryColorLight,
                    backgroundColor: Theme.of(context).cardColor,
                    labelStyle: TextStyle(
                      color: selectedChips.contains(option)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.titleMedium!.color,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  children: [
                    for (var option in selectedChips)
                      Padding(
                        padding: const EdgeInsets.only(bottom: MAIN_PADDING),
                        child: UploadDocumentWidget(
                          labelString: 'Take a photo or Upload ($option)',
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
