import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../shared/app_assets.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import 'bottom_edit.dart';
import '../data/physicians_dto.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicianItem extends StatefulWidget {
  const PhysicianItem({required this.physicianItem, super.key});
  final PhysiciansDTO physicianItem;

  @override
  State<PhysicianItem> createState() => _PhysicianItemState();
}

class _PhysicianItemState extends State<PhysicianItem> {
  @override
  Widget build(BuildContext context) {
    final physicianItem = widget.physicianItem;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      physicianItem.doctorFullName ?? '',
                      style: context.text.g18w500,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      textAlign: TextAlign.left,
                      physicianItem.speciality?.name ?? '',
                      style: context.text.g14w500,
                    ),
                    const SizedBox(height: 4),
                    if (physicianItem.link != null)
                      InkWell(
                        onTap: () async {
                          final telephoneUrl = 'tel:${physicianItem.phone}';
                          if (await canLaunch(telephoneUrl)) {
                            await launch(telephoneUrl);
                          } else {
                            throw 'Error occured trying to call that number.';
                          }
                        },
                        child: Text(
                          physicianItem.phone ?? '',
                          style: context.text.ga14w600,
                        ),
                      ),
                    if (physicianItem.link != null)
                      InkWell(
                        onTap: () async {
                          //TODO mailto:<email address>? ???
                          final url = 'https:${physicianItem.link}';
                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          physicianItem.link ?? '',
                          style: context.text.ga14w600,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  physEdittBottomSheet(context, physicianItem);
                },
                icon: SvgPicture.asset(
                  CoreAssets.svg.i3dots,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
