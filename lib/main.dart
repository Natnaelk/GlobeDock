import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/themes.dart';
import 'package:flutter/material.dart';
import 'package:globedock/src/domain/repositories/autentication_repository.dart';
import 'package:globedock/src/domain/usecase/login.dart';
import 'package:globedock/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:globedock/src/presentation/bloc/sign_in_form/sign_in_form_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/utilities/go_router_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => initializeDateFormatting().then((_) => runApp(const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    AuthenticationRepository? repo;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticatorWatcherBloc()),
        BlocProvider(create: (context) => SignInFormBloc(SignIn(repo!))),
      ],
      child: ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: themeLight(context),
              darkTheme: themeDark(context),
              themeMode: ThemeMode.light,
              routerConfig: routerinit,
            );
          }),
    );
  }
}
