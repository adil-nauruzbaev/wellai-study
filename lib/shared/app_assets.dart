abstract class CoreAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  static const path = 'assets/images';

  String get onbording1 => '$path/onboarding_1.jpg';
  String get onbording2 => '$path/onboarding_2.jpg';
  String get onbording3 => '$path/onboarding_3.jpg';
  String get onbording4 => '$path/onboarding_4.jpg';
  String get greeanMikeHome => '$path/green_mike_home.png';
  String get logoLhat => '$path/logo_chat.jpg';
  String get successDocumentUploaded =>
      '$path/imagi_success_document_uploaded_v2.png';
  String get avatarAsset => '$path/avatar_asset.jpg';
  String get thCalendarNodata => '$path/th_calendar_nodata.png';

  String get calendarEmptyIcon => '$path/empty_calendar.png';
}

class _Svg {
  const _Svg();

  static const path = 'assets/svg';

  String get eyeShut => '$path/eye_shut.svg';
  String get eye => '$path/eye.svg';
  String get logoBlack => '$path/logo_black.svg';
  String get iChatBold => '$path/icon_chat_bold.svg';
  String get iChatLight => '$path/icon_chat_light.svg';
  String get iHomeBold => '$path/icon_home_bold.svg';
  String get iHomeLight => '$path/icon_home_light.svg';
  String get iprofileBold => '$path/icon_profile_bold.svg';
  String get iprofileLight => '$path/icon_profile_light.svg';
  String get isettingBold => '$path/icon_setting_bold.svg';
  String get isettingLight => '$path/icon_setting_light.svg';
  String get iVoice => '$path/icon_voice.svg';
  String get iNotification => '$path/icon_notification.svg';
  String get elippseGroup => '$path/elippse_group.svg';
  String get iCalandar => '$path/icon_calendar.svg';
  String get iArrowDown => '$path/icon_arrow_down.svg';
  String get iArrowRight => '$path/icon_arrow_right.svg';
  String get iPus => '$path/icon_plus.svg';
  String get idismiss => '$path/icon_dismiss.svg';
  String get notificationNull => '$path/notification_null.svg';
  String get iBigNotification => '$path/icon_big_notification.svg';
  String get mesageLogo1 => '$path/mesage_logo1.svg';
  String get newNotificatorIndicator => '$path/new_notificator_indicator.svg';
  String get iDelete => '$path/icon_delete.svg';
  String get iconPhone => '$path/icon_phone.svg';
  String get i3dots => '$path/icon_3dots.svg';
  String get iFilter => '$path/icon_stroke.svg';
  String get iSorte => '$path/icon_sort.svg';
  String get imagiSuccessDocumentUp =>
      '$path/imagi_success_document_uploaded.svg';
  String get iGred => '$path/icon_gred.svg';
  String get iList => '$path/icon_list.svg';
  String get imgEmptyDocumentList => '$path/img_empty_document_list.svg';
  String get imgEmptyListDocumentsRequest =>
      '$path/img_empty_list_documents_request.svg';
  String get iUpload => '$path/icon_upload.svg';

  String get vectorCalendarNodata => '$path/vector_calendar_nodata.svg';
  String get claendarIcon => '$path/claendar_icon.svg';
}
