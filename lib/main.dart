import 'dart:async';
import 'onbording/onboarding_screen.dart';
import 'shared/init/app_global_keys.dart';
import 'shared/init/core_d_i.dart';
import 'shared/l10n/locale_repo.dart';
import 'shared/theme/repo/theme_repo.dart';
import 'shared/theme/themes/_interface/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'shared/init/orchestrator/biz_orchestrator.dart';
import 'shared/l10n/generated/l10n.dart';
import 'shared/widgets/logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      CoreDi.register();
      await CoreDi.get.allReady();

      runApp(
        CoreOrchestrator(
          builder: (context) {
            return ValueListenableBuilder<AppTheme>(
              valueListenable: CoreDi.get<ThemeRepo>().theme,
              builder: (context, theme, _) {
                return GlobalLoaderOverlay(
                  overlayColor: Colors.black,
                  overlayOpacity: 0.45,
                  useDefaultLoading: false,
                  overlayWidget: const CircularProgressIndicator.adaptive(),
                  child: ValueListenableBuilder<Locale>(
                    valueListenable: CoreDi.get<LocaleRepo>().locale,
                    builder: (context, locale, _) {
                      return MaterialApp(
                        key: const ValueKey('App'),
                        scaffoldMessengerKey: AppGlobalKeys.scaffoldMessenger,
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: const [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        locale: locale,
                        supportedLocales: S.delegate.supportedLocales,
                        title: 'WellAI',
                        home: const OnboardingScreen(),
                        theme: theme.data,
                        navigatorKey: AppGlobalKeys.rootNavigator,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      );
    },
    Log.error,
  );
}
