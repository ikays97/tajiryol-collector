import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String _appFontFamily = 'Montserrat';
const Color _textLightColor = Color(0xFF000000);

const int _appPrimaryColorValue = 0xFF002821;
const MaterialColor appPrimarySwatch =
    MaterialColor(_appPrimaryColorValue, <int, Color>{
  50: Color(0xFF00c9a7),
  100: Color(0xff00b596),
  200: Color(0xff00a186),
  300: Color(0xff008d75),
  400: Color(0xff007964),
  500: Color(0xff006554),
  600: Color(0xff005043),
  700: Color(0xff003c32),
  800: Color(0xff002821),
  900: Color(0xff001411),
});

TextTheme _lightTextTheme(Typography typography) {
  final textTheme = typography.black;
  return textTheme.apply(
    fontFamily: _appFontFamily,
    displayColor: _textLightColor,
    bodyColor: _textLightColor,
  );
}

ThemeData genAppLightTheme() {
  final typography = Typography.material2018();
  final lightTextTheme = _lightTextTheme(typography);
  return ThemeData(
    primarySwatch: appPrimarySwatch,
    brightness: Brightness.light,
    primaryColor: Color(_appPrimaryColorValue),
    accentColorBrightness: Brightness.dark,
    fontFamily: _appFontFamily,
    typography: typography,
    textTheme: lightTextTheme,
    canvasColor: const Color(0xffeff2f8),
    inputDecorationTheme: const InputDecorationTheme(filled: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      foregroundColor: _textLightColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: PageTransitionsTheme(
        builders: Map.fromIterable(
      TargetPlatform.values,
      key: (dynamic e) => e as TargetPlatform,
      value: (dynamic e) => CupertinoPageTransitionsBuilder(),
    )),
  );
}

class AppSettings {
  final ThemeData theme;
  final Locale locale;

  const AppSettings({
    @required this.theme,
    @required this.locale,
  });

  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    return theme.brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }

  AppSettings copyWith({
    ThemeData theme,
    Locale locale,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettings && theme == other.theme && locale == other.locale;

  @override
  int get hashCode => theme.hashCode ^ locale.hashCode;

  static AppSettings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppSettings newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState?.updateModel(newModel);
  }
}

class _ModelBindingScope extends InheritedWidget {
  final _ModelBindingState modelBindingState;

  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  final AppSettings initialModel;
  final Widget child;

  ModelBinding({
    @required this.initialModel,
    @required this.child,
  });

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  AppSettings currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppSettings newModel) {
    if (currentModel != newModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
