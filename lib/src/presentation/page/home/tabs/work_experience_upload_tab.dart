import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class WorkExperienceUploadTab extends StatefulWidget {
  const WorkExperienceUploadTab({Key? key}) : super(key: key);

  @override
  State<WorkExperienceUploadTab> createState() =>
      _WorkExperienceUploadTabState();
}

class _WorkExperienceUploadTabState extends State<WorkExperienceUploadTab> {
  int itemIndex = 1;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: itemIndex,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return WorkExperienceUploadForm(
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

class WorkExperienceUploadForm extends StatefulWidget {
  const WorkExperienceUploadForm({
    Key? key,
    this.onAddNewPressed,
    this.firstTime,
    this.lastTime,
  }) : super(key: key);

  final VoidCallback? onAddNewPressed;
  final bool? firstTime;
  final bool? lastTime;

  @override
  State<WorkExperienceUploadForm> createState() =>
      _WorkExperienceUploadFormState();
}

class _WorkExperienceUploadFormState extends State<WorkExperienceUploadForm> {
  bool haveWorkExperience = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.firstTime!
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'I have work Experience',
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
                        haveWorkExperience = value == 'Yes';
                      });
                    },
                    options: [
                      'Yes',
                      'No',
                    ]
                        .map((lang) => FormBuilderFieldOption(value: lang))
                        .toList(growable: false),
                  ),
                ],
              )
            : SizedBox(),
        haveWorkExperience
            ? UploadDocumentWidget(
                labelString: widget.firstTime!
                    ? 'Experience Letter*'
                    : 'Additional Experience Letter*',
              )
            : SizedBox(),
        SizedBox(
          height: SPACE20,
        ),
        widget.lastTime! && haveWorkExperience
            ? GestureDetector(
                onTap: widget.onAddNewPressed,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Add New+',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: CustomFontSize.s13))
                ]),
              )
            : SizedBox()
      ],
    );
  }
}
