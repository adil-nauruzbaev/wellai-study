import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/init/core_d_i.dart';
import '../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../data/bloc/bloc.dart';
import '../../data/dto/profile_info_dto.dart';
import 'widgets/app_bar.dart';
import 'widgets/list_of_tails.dart';

class PersonalInfoDetails extends StatefulWidget {
  const PersonalInfoDetails({
    super.key,
    this.profileInfoDTO,
    this.imagePath,
  });

  final ProfileInfoDTO? profileInfoDTO;
  final String? imagePath;

  @override
  State<PersonalInfoDetails> createState() => _PersonalInfoDetailsState();
}

class _PersonalInfoDetailsState extends State<PersonalInfoDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      bloc: CoreDi.get<PersonalInfoBloc>(),
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverAppBar(
                    forceElevated: true,
                    elevation: 2,
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: context.color.shadow,
                        size: 32,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    automaticallyImplyLeading: false,
                    floating: true,
                    pinned: true,
                    backgroundColor: context.color.background,
                    surfaceTintColor: context.color.background,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: AppBarrPI(
                        imagePath: widget.imagePath,
                      ),
                    ),
                  ),
                ];
              },
              body: ListOfTails(
                profileInfoDTO: widget.profileInfoDTO,
              ),
            ),
          ),
        );
      },
    );
  }
}
