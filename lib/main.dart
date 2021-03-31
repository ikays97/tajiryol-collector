import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tajiryol_collector/pages/home/home.dart';
import 'app_settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CollectorApp());
}

class CollectorApp extends StatefulWidget {
  @override
  _CollectorAppState createState() => _CollectorAppState();
}

class _CollectorAppState extends State<CollectorApp> {
  Future<SharedPreferences> prefsFuture;

  Widget buildInitialData(BuildContext context, SharedPreferences prefs) {
    const localeEN = const Locale('en', 'EN');
    const supportedLocales = [localeEN];
    return ModelBinding(
      initialModel: AppSettings(
        locale: localeEN,
        theme: genAppLightTheme(),
      ),
      child: Builder(
        builder: (context) {
          final settings = AppSettings.of(context);
          final token = prefs?.getString('token');
          return GetMaterialApp(
            title: 'Tajiryol Collector',
            debugShowCheckedModeBanner: false,
            theme: genAppLightTheme(),
            locale: settings?.locale,
            supportedLocales: supportedLocales,
            builder: (context, child) => _Unfocus(child: child),
            home: HomePage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (prefsFuture == null) {
      prefsFuture = SharedPreferences.getInstance();
    }
    return FutureBuilder<SharedPreferences>(
      future: prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildInitialData(context, snapshot.data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus.unfocus(),
      child: child,
    );
  }
}
