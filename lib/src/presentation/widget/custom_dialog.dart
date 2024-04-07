// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/screens.dart';
import 'package:globedock/src/common/toast.dart';
import 'package:globedock/src/presentation/cubit/theme/theme_cubit.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:globedock/src/presentation/widget/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

showCallDialog(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 170,
        width: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: CustomIconButton(
                    icon: SvgPicture.asset(
                      CustomIcons.CALL,
                      color: Theme.of(context).dialogBackgroundColor,
                    ),
                    onTap: () async {
                      if (await canLaunch('tel:098765432')) {
                        launch('tel:098765432');
                      } else {
                        showToast(
                            msg: 'Can not launch',
                            textColor: Colors.white,
                            backgroundColor: Colors.red);
                      }
                    },
                    color: Theme.of(context).cardColor,
                    label: 'Call 0987654356',
                    labelColor: Theme.of(context).dialogBackgroundColor,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: CustomElevatedButton(
                    onTap: () => Navigator.of(context).pop(),
                    color: Theme.of(context).cardColor,
                    label: 'Cancel',
                    labelColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

FutureOr<dynamic> showBottomDialog(
  BuildContext context, {
  required Widget child,
}) {
  final theme = Theme.of(context);
  return showModalBottomSheet(
    context: context,
    backgroundColor: theme.cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(RADIUS),
        topRight: Radius.circular(RADIUS),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RADIUS),
            topRight: Radius.circular(RADIUS),
          ),
        ),
        width: Screens.width(context),
        child: child,
      );
    },
  );
}

FutureOr<dynamic> showPickImageDialog(
  BuildContext context, {
  required VoidCallback onCameraTap,
  required VoidCallback onGalleryTap,
}) {
  final theme = Theme.of(context);
  return showModalBottomSheet(
    context: context,
    backgroundColor: theme.cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(RADIUS),
        topRight: Radius.circular(RADIUS),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RADIUS),
            topRight: Radius.circular(RADIUS),
          ),
        ),
        width: Screens.width(context),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SPACE8),
            Center(
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: theme.hintColor,
                  borderRadius: BorderRadius.circular(
                    RADIUS,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                _BuildButtonIcon(
                  icon: Icons.photo,
                  label: 'Gallery',
                  onTap: onGalleryTap,
                ),
                const SizedBox(width: SPACE25),
                _BuildButtonIcon(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: onCameraTap,
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

FutureOr<dynamic> showConfirmationDialog(
  BuildContext context, {
  bool barrierDismissible = false,
  required String title,
  required String primaryButtonLabel,
  String? secondaryButtonLabel,
  required VoidCallback onPrimaryButtonTap,
  VoidCallback? onSecondaryButtonTap,
}) {
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return AlertDialog.adaptive(
            backgroundColor:
                (state is ThemeDark) ? ColorDark.card : ColorLight.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomOutlinedButton(
                            onTap: (onSecondaryButtonTap == null)
                                ? () => Navigator.pop(context)
                                : onSecondaryButtonTap,
                            label: (secondaryButtonLabel == null)
                                ? 'Back'
                                : secondaryButtonLabel,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CustomElevatedButton(
                            onTap: onPrimaryButtonTap,
                            label: primaryButtonLabel,
                            color: theme.primaryColor,
                            labelColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _BuildButtonIcon extends StatelessWidget {
  const _BuildButtonIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: theme.primaryColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: SPACE8),
          Text(
            label,
            style: theme.textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
