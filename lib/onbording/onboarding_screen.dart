import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/ui/login_screen.dart';
import '../shared/app_assets.dart';
import '../shared/data/root_gateway/root_gateway.dart';
import '../shared/init/core_d_i.dart';
import '../shared/l10n/generated/l10n.dart';
import '../shared/l10n/l10n_helper.dart';

import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/logger.dart';
import '../splash_screen/splash_screen.dart';
import 'data/bloc/bloc.dart';
import 'ui/onboarding_data.dart';
import 'ui/onboarding_pages.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late final List<OnboardingPageData> onboardingPagesData;

  @override
  void initState() {
    onboardingPagesData = [
      OnboardingPageData(
        title: S.current.onboardingScreenTitle1,
        description: S.current.onboardingScreenComent1,
        imageUrl: CoreAssets.images.onbording1,
      ),
      OnboardingPageData(
        title: S.current.onboardingScreenTitle2,
        description: S.current.onboardingScreenComent2,
        imageUrl: CoreAssets.images.onbording2,
      ),
      OnboardingPageData(
        title: S.current.onboardingScreenTitle3,
        description: S.current.onboardingScreenComent3,
        imageUrl: CoreAssets.images.onbording3,
      ),
      OnboardingPageData(
        title: S.current.onboardingScreenTitle4,
        description: S.current.onboardingScreenComent4,
        imageUrl: CoreAssets.images.onbording4,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => InitialBloc(
          local: CoreDi.get(),
        )..add(InitialInit()),
        child: BlocListener<InitialBloc, InitialState>(
          listener: (context, state) {
            if (state is InitialAuth) {
              CoreDi.get<RootGateway>().token = state.token;
              context.rootRouter.use.push(const SplashScreen());
              Log.w(state.token);
            }
          },
          child: Stack(
            children: <Widget>[
              PageView.builder(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingPagesData.length,
                itemBuilder: (_, index) {
                  return OnboardingPage(
                    data: onboardingPagesData[index],
                  );
                },
              ),
              Positioned(
                right: 16,
                top: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  children: List<Widget>.generate(onboardingPagesData.length, (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 8,
                      width: (index == _currentPage) ? 24 : 12,
                      margin: EdgeInsets.only(
                        left: index == 0
                            ? 5
                            : (index == _currentPage || index - 1 == _currentPage)
                                ? 8
                                : 4,
                        right: index == onboardingPagesData.length - 1
                            ? 5
                            : (index == _currentPage || index + 1 == _currentPage)
                                ? 8
                                : 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: (index == _currentPage)
                            ? context.color.background
                            : context.color.background.withOpacity(0.4),
                      ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: context.button.elevated3,
                          onPressed: () {
                            context.rootRouter.use.push(const AuthScreen());
                          },
                          child: Text(context.s.login),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
