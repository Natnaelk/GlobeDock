import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            'Quick Actions',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ]),
        SizedBox(
          height: 15.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RADIUS),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(MAIN_PADDING),
            child: Column(children: [
              GestureDetector(
                onTap: () =>
                    GoRouter.of(context).go(AppRoutes.FILL_PROFILE_ROUTE_PATH),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fill Profile Details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_right))
                      ],
                    ),
                    const SizedBox(
                      height: SPACE10,
                    ),
                    StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 32,
                      size: 12,
                      padding: 0,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor: Theme.of(context).primaryColorLight,
                      roundedEdges: const Radius.circular(RADIUS),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: SPACE15,
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context)
                    .go(AppRoutes.UPLOAD_DOCUMENTS_ROUTE_PATH),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload Documents',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_right))
                      ],
                    ),
                    const SizedBox(
                      height: SPACE10,
                    ),
                    StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 50,
                      size: 12,
                      padding: 0,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor: Theme.of(context).primaryColorLight,
                      roundedEdges: const Radius.circular(RADIUS),
                    ),
                  ],
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}
