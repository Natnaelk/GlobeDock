import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';

class UploadDocumentWidget extends StatelessWidget {
  final String? labelString;

  const UploadDocumentWidget({Key? key, this.labelString = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelString!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(
            height: SPACE15,
          ),
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DottedBorder(
              radius: const Radius.circular(RADIUS),
              borderType: BorderType.RRect,
              dashPattern: const [8, 5],
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SvgPicture.asset(
                      CustomIcons.CAMERA,
                      height: 30.h,
                      width: 30.w,
                    )
                  ]),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    width: 200.w,
                    height: 35.h,
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) => SafeArea(
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              CustomIcons.CAMERA_FILLED,
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              'Camera',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                                CustomIcons.UPLOAD_FILLED),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              'Upload',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                  CustomIcons.CLOSE_FILLED),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(
                                                'Close',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    color: Theme.of(context).primaryColorLight,
                    label: 'Take a photo or upload',
                    labelColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                      "file extensions supported, pdf, doc, docx, jpeg, jpg, png",
                      style: TextStyle(
                          fontSize: 11.0,
                          color: Theme.of(context).disabledColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
