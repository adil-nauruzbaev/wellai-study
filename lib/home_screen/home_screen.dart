import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../notifications/notifications_screen.dart';
import '../profile/features/personal_info/features/my_physicians/features/add_physician/data/bloc/bloc.dart';
import '../shared/app_assets.dart';
import '../shared/doc_categories/bloc/bloc.dart';
import '../shared/init/core_d_i.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import 'data/temp_models.dart';
import 'ui/feature/chat_with_assistant_container/chat_with_assistant_container.dart';
import 'ui/feature/clinic_news/clinic_news.dart';
import 'ui/feature/clinic_news/clinic_news_screen.dart';
import 'ui/feature/stories/stories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    CoreDi.get<CategoriesBloc>().add(FetchCategories());
    CoreDi.get<QualifificationBloc>().add(FetchQualiffication());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
        child: AppBar(
          backgroundColor: context.color.background,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(userProfile.photoUrl),
                ),
              ),
            ],
          ),
          title: Text(
            'Hello, ${userProfile.name}!',
            style: context.text.m24w400,
          ),
          actions: [
            SizedBox(
              height: 32,
              width: 32,
              child: IconButton(
                onPressed: () {
                  context.rootRouter.use.push(const NotificationsScreen());
                },
                icon: SvgPicture.asset(CoreAssets.svg.iNotification),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: StoriesListWidget(),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              sliver: SliverToBoxAdapter(
                child: ChatWithAssistentContainer(),
              ),
            ),
            SliverPadding(
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.s.clinicNews,
                      style: context.text.m18w400,
                    ),
                    TextButton(
                      onPressed: () {
                        context.rootRouter.use.push(const ClinicNewsScreen());
                      },
                      child: Text(context.s.showAll),
                    ),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SliverPadding(
              sliver: ClinicNews(),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
