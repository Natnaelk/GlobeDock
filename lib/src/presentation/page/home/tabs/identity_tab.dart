import 'package:flutter/material.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class IdentityTab extends StatelessWidget {
  const IdentityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: const [
          UploadDocumentWidget(
            labelString: 'Passport',
          ),
          SizedBox(height: SPACE15),
          UploadDocumentWidget(
            labelString: 'Visa',
          ),
          SizedBox(height: SPACE15),
          UploadDocumentWidget(
            labelString: 'Photo 3x4*',
          )
        ]),
      ),
    );
  }
}
