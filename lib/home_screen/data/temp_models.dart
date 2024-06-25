import '../../shared/app_assets.dart';

class UserProfile {
  UserProfile({required this.name, required this.photoUrl});
  final String name;
  final String photoUrl;
}

UserProfile userProfile = UserProfile(
  name: 'Elizabeth',
  photoUrl: CoreAssets.images.onbording2,
);
