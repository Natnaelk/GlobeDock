import 'package:flutter/material.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/upload_document_widget.dart';

class IdentityTab extends StatelessWidget {
  const IdentityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: const [
        UploadDocumentWidget(
          labelString: 'Passport front',
        ),
        SizedBox(
          height: SPACE15,
        ),
        UploadDocumentWidget(
          labelString: 'Passport back',
        ),
        SizedBox(height: SPACE15),
        UploadDocumentWidget(
          labelString: 'Visa',
        )
      ]),
    );
  }
}
