import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../home/ui/home_screen.dart';
import '../calendar/ui/calendar_screen.dart';
import '../medical_records/ui/records_screen.dart';
import '../notifications/ui/notifications_screen.dart';

class DocRootScreen extends StatefulWidget {
  const DocRootScreen({super.key});

  @override
  State<DocRootScreen> createState() => _DocRootScreenState();
}

class _DocRootScreenState extends State<DocRootScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreenDoctor(),
    const CalendarScreenDoctor(),
    const RecordsScreen(),
    NotificationsDocScreen(),
    const SizedBox.shrink(),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
