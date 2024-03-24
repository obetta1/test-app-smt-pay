import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_export.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/pref_utils.dart';
import 'core/utils/size_utils.dart';
import 'domain/repository/repository.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([PrefUtils().init()]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Repository(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return BlocProvider(
            create: (context) => ThemeBloc(
              ThemeState(
                themeType: PrefUtils().getThemeData(),
              ),
            ),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: theme,
                  title: 'smart_pay_app',
                  navigatorKey: NavigatorService.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizationDelegate(),
                  ],
                  supportedLocales: const [
                    Locale(
                      'en',
                      '',
                    ),
                  ],
                  initialRoute: AppRoutes.initialRoute,
                  onGenerateRoute: AppRoutes.generateRoute,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
