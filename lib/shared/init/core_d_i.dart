import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../1_sing_tele_health/data/bloc/bloc.dart';
import '../../1_sing_tele_health/data/work_th_api.dart';
import '../../doctor_app/calendar/data/bloc/calendar_bloc.dart';
import '../../doctor_app/calendar/data/calendar_api.dart';
import '../../doctor_app/medical_records/data/api/documents_api.dart';
import '../../doctor_app/medical_records/data/bloc/categories/category_bloc.dart';
import '../../doctor_app/medical_records/data/api/categories_api.dart';
import '../../doctor_app/medical_records/data/bloc/documents/documents_bloc.dart';
import '../../doctor_app/notifications/data/bloc/notifications/notifications_bloc.dart';
import '../../doctor_app/notifications/data/notifications_api.dart';
import '../../history/data/bloc/history_bloc.dart';
import '../../history/data/source/history_api.dart';
import '../../home_screen/data/bloc_news/news_bloc.dart';
import '../../home_screen/data/bloc_stories/stories_bloc.dart';
import '../../home_screen/data/source_home/home_news_api.dart';
import '../../home_screen/data/source_home/home_stories_api.dart';
import '../../notifications/data/bloc/notifications_bloc.dart';
import '../../notifications/data/source_notifications/notifications_api.dart';
import '../../profile/features/medical_records/data/bloc/documents_model_bloc/bloc.dart';
import '../../profile/features/medical_records/data/source/documents_model_api.dart';
import '../../profile/features/medical_records/ui/feature/files_picker/data/bloc/bloc.dart';
import '../../profile/features/medical_records/ui/feature/files_picker/data/post_documents_api.dart';
import '../../profile/features/personal_info/data/bloc/bloc.dart';
import '../../profile/features/personal_info/data/source/profile_info_api.dart';

import '../../profile/features/personal_info/features/my_physicians/features/add_physician/data/bloc/bloc.dart';
import '../../profile/features/personal_info/features/my_physicians/features/add_physician/data/qualifification_api.dart';
import '../../profile/features/personal_info/features/my_physicians/features/physicians/data/bloc/bloc.dart';
import '../../profile/features/personal_info/features/my_physicians/features/physicians/data/physiciams_api.dart';
import '../../questionnaire/feature/pharmacies/data/bloc/bloc.dart';
import '../../questionnaire/feature/pharmacies/data/sourse/pharmacy_api.dart';
import '../../questionnaire/feature/states/data/bloc/bloc.dart';
import '../../questionnaire/feature/states/data/sourse/States_api.dart';
import '../data/root_gateway/root_gateway.dart';
import '../doc_categories/bloc/bloc.dart';
import '../doc_categories/source_doc_categories/api_doc.dart';
import '../l10n/locale_repo.dart';
import '../l10n/source/local_storage.dart';
import '../secure_storage.dart';
import '../theme/repo/theme_repo.dart';
import '../../doctor_app/home/data/news_api.dart';
import '../../doctor_app/home/data/bloc/clinic_news/news_bloc.dart';

class CoreDi {
  static GetIt get = GetIt.asNewInstance();

  static void register() {
    get
      ..registerSingletonAsync(() => LocalStorage.instance)
      ..registerSingleton(
        SecureStorage(
          const FlutterSecureStorage(
            aOptions: AndroidOptions(
              encryptedSharedPreferences: true,
            ),
          ),
        ),
      )
      ..registerSingleton(ThemeRepo())
      ..registerSingleton(LocaleRepo())
      ..registerLazySingleton(
        () => NewsBloc(
          NewsApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => NewsDoctorBloc(
          NewsDoctorApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => NotificationsDocBloc(
          NotificationsDocApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => CalendarDocBloc(
          CalendarDocApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => CategoriesDocBloc(
          CategoriesApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => DocumentsDocBloc(
          DocumentsApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => StoriesBloc(
          StoriesApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => PharmaciesBloc(
          remote: PharmacyApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => StatesUsBloc(
          remote: StatesApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => NotificationsBloc(
          notificationsApi: NotificationsApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => HistoryBloc(
          historyApi: HistoryApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => CategoriesBloc(
          DocCategoriesApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => DocumentlBloc(
          DocumentsModelApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => FilesPickerBloc(
          PostDocumentsApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => PersonalInfoBloc(
          ProfileInfoApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => QualifificationBloc(
          QualifificationApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => PhysiciansBloc(
          PhysiciansApi(
            api: get(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => WorkThBloc(
          WorkThApi(
            api: get(),
          ),
        ),
      )
      ..registerSingleton<RootGateway>(RootGateway());
  }

//read data which is NOT accessible without auth
  static Future<void> initProtected() async {}

//read data which IS accessible without auth
  static Future<void> initUnprotected() async {}
}
