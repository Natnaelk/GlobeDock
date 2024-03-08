import 'package:flutter/material.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';
import 'package:go_router/go_router.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () async {},
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: ClipOval(
                child: CustomImage(
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  image: 'hello',
                ),
              ),
            ),
            const SizedBox(width: MAIN_PADDING),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Abel Belay',
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () => GoRouter.of(context)
                                    .go(AppRoutes.PROFILE_ROUTE_PATH),
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ))
                          ]),
                    ),
                    Text(
                      'Abel@gmail.com',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
