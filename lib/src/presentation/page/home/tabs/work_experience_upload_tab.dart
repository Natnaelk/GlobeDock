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

class WorkExperienceUploadForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        firstTime!
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
        UploadDocumentWidget(
          labelString: firstTime!
              ? 'Experience Letter*'
              : 'Additional Experience Letter*',
        ),
        SizedBox(
          height: SPACE20,
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
      ],
    );
  }
}
