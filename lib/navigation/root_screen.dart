import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../history/history_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile/features/personal_info/personal_info_screen.dart';
import '../questionnaire/questionnaire_1.dart';
import '../settings/sttings_screen.dart';
import '../shared/app_assets.dart';
import '../shared/theme/themes/_interface/app_theme.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const Questionnaire1(),
    const ProfilePersonalInfoScreen(),
    const SettingsScreen(),
  ];

  void onSelectPage(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.color.accent,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            onSelectPage(2);
          },
          backgroundColor: context.color.accent,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 64,
            child: SvgPicture.asset(CoreAssets.svg.iVoice),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          //item start 1
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iHomeLight),
            ),
            label: '',
            activeIcon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iHomeBold),
            ),
          ), //item end
          //item start 2
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iChatLight),
            ),
            label: '',
            activeIcon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iChatBold),
            ),
          ), //item end
          //item start 3
          const BottomNavigationBarItem(
            icon: SizedBox(
              width: 32,
              child: Opacity(
                opacity: 0,
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.transparent,
                ),
              ),
            ),
            label: '',
          ), //item end
          //item start 4
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iprofileLight),
            ),
            label: '',
            activeIcon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.iprofileBold),
            ),
          ), //item end
          //item start 5
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.isettingLight),
            ),
            label: '',
            activeIcon: SizedBox(
              width: 32,
              child: SvgPicture.asset(CoreAssets.svg.isettingBold),
            ),
          ), //item end
        ],
        onTap: onSelectPage,
      ),
    );
  }
}

////
///
///
