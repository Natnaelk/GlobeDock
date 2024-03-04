import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class OtherTab extends StatelessWidget {
  const OtherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: FormBuilderTextField(
              name: 'grade',
              onChanged: (val) {
                print(val);
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  label: Text('Any other Document: Name',
                      style: Theme.of(context).textTheme.titleMedium),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(RADIUS),
                      borderSide:
                          BorderSide(color: Theme.of(context).disabledColor))),
            ),
          ),
          const SizedBox(
            height: SPACE20,
          ),
          const UploadDocumentWidget(
            labelString: 'Document',
          )
        ],
      ),
    );
  }
}
