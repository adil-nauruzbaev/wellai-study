// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Что-то пошло не так`
  String get errorGeneral {
    return Intl.message(
      'Что-то пошло не так',
      name: 'errorGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Check data`
  String get checkData {
    return Intl.message(
      'Check data',
      name: 'checkData',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'Log In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Bent Tree Family Physicians`
  String get onboardingScreenTitle1 {
    return Intl.message(
      'Bent Tree Family Physicians',
      name: 'onboardingScreenTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Bent Tree Family Physicians`
  String get onboardingScreenTitle2 {
    return Intl.message(
      'Bent Tree Family Physicians',
      name: 'onboardingScreenTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Award-Winning VirtualAssistant`
  String get onboardingScreenTitle3 {
    return Intl.message(
      'Award-Winning VirtualAssistant',
      name: 'onboardingScreenTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get onboardingScreenTitle4 {
    return Intl.message(
      'Create your account',
      name: 'onboardingScreenTitle4',
      desc: '',
      args: [],
    );
  }

  /// `We are here for you 24/7`
  String get onboardingScreenComent1 {
    return Intl.message(
      'We are here for you 24/7',
      name: 'onboardingScreenComent1',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Telehealth or Office Visit, Contact your Healthcare Team,  View your Lab Results, Request Referrals, Refill Medications`
  String get onboardingScreenComent2 {
    return Intl.message(
      'Schedule Telehealth or Office Visit, Contact your Healthcare Team,  View your Lab Results, Request Referrals, Refill Medications',
      name: 'onboardingScreenComent2',
      desc: '',
      args: [],
    );
  }

  /// `Search Over 30 Million Medical References to Help Diagnose your Symptoms`
  String get onboardingScreenComent3 {
    return Intl.message(
      'Search Over 30 Million Medical References to Help Diagnose your Symptoms',
      name: 'onboardingScreenComent3',
      desc: '',
      args: [],
    );
  }

  /// `Or Log In if you already have an account to start`
  String get onboardingScreenComent4 {
    return Intl.message(
      'Or Log In if you already have an account to start',
      name: 'onboardingScreenComent4',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong :(`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong :(',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `User not authorized`
  String get userNotAuthorized {
    return Intl.message(
      'User not authorized',
      name: 'userNotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Password is empty`
  String get inputErrorPasswordIsEmpty {
    return Intl.message(
      'Password is empty',
      name: 'inputErrorPasswordIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Passowrd is too short`
  String get inputErrorPasswordIsShort {
    return Intl.message(
      'Passowrd is too short',
      name: 'inputErrorPasswordIsShort',
      desc: '',
      args: [],
    );
  }

  /// `Passowrd must contain 1 digit`
  String get inputErrorPasswordMustContainDigit {
    return Intl.message(
      'Passowrd must contain 1 digit',
      name: 'inputErrorPasswordMustContainDigit',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password`
  String get enterYourEmailAndPassword {
    return Intl.message(
      'Enter your email and password',
      name: 'enterYourEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'pleaseEnterYourEmail ' key

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Bent Tree Family\nPhysician’s App`
  String get WelcomeToBentTreeFamilyPhysiciansApp {
    return Intl.message(
      'Welcome To Bent Tree Family\nPhysician’s App',
      name: 'WelcomeToBentTreeFamilyPhysiciansApp',
      desc: '',
      args: [],
    );
  }

  /// `Please type your full name:`
  String get PleaseTypeYourFullName {
    return Intl.message(
      'Please type your full name:',
      name: 'PleaseTypeYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `I agree to `
  String get IAgreeTo {
    return Intl.message(
      'I agree to ',
      name: 'IAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Bent Tree Family Physician’s Terms of Use `
  String get BentTreeFamilyPhysicianTermsofUse {
    return Intl.message(
      'Bent Tree Family Physician’s Terms of Use ',
      name: 'BentTreeFamilyPhysicianTermsofUse',
      desc: '',
      args: [],
    );
  }

  /// `and confirm that I’m at least 17 years old`
  String get AndConfirmThatImAtLeast17YearsOld {
    return Intl.message(
      'and confirm that I’m at least 17 years old',
      name: 'AndConfirmThatImAtLeast17YearsOld',
      desc: '',
      args: [],
    );
  }

  /// `Bent Tree Family Physician’s HIPAA Notice of Privacy Practices`
  String get BentTreeFamilyPhysician {
    return Intl.message(
      'Bent Tree Family Physician’s HIPAA Notice of Privacy Practices',
      name: 'BentTreeFamilyPhysician',
      desc: '',
      args: [],
    );
  }

  /// `Bent Tree Family Physician’s Privacy Policy`
  String get BentTreeFamilyPhysiciansPrivacyPolicy {
    return Intl.message(
      'Bent Tree Family Physician’s Privacy Policy',
      name: 'BentTreeFamilyPhysiciansPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get createNewPassword {
    return Intl.message(
      'Create new password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `You used the one-time password from the invitation. Please create a new password.`
  String get youUsedTheOneTimePassword {
    return Intl.message(
      'You used the one-time password from the invitation. Please create a new password.',
      name: 'youUsedTheOneTimePassword',
      desc: '',
      args: [],
    );
  }

  /// `Create password`
  String get reatePassword {
    return Intl.message(
      'Create password',
      name: 'reatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed! 🥳`
  String get passwordChanged {
    return Intl.message(
      'Password changed! 🥳',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully changed your password! Don’t forget it so that next time you can successfully log into your account`
  String get youHaveSuccessfullyChangedTourPassword {
    return Intl.message(
      'You have successfully changed your password! Don’t forget it so that next time you can successfully log into your account',
      name: 'youHaveSuccessfullyChangedTourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `How are you feeling?`
  String get howAreYouFeeling {
    return Intl.message(
      'How are you feeling?',
      name: 'howAreYouFeeling',
      desc: '',
      args: [],
    );
  }

  /// `Tell the assistant what’s bothering you and get your possible diagnoses`
  String get tellTheAssistantWhat {
    return Intl.message(
      'Tell the assistant what’s bothering you and get your possible diagnoses',
      name: 'tellTheAssistantWhat',
      desc: '',
      args: [],
    );
  }

  /// `Clinic news`
  String get clinicNews {
    return Intl.message(
      'Clinic news',
      name: 'clinicNews',
      desc: '',
      args: [],
    );
  }

  /// `show all`
  String get showAll {
    return Intl.message(
      'show all',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `Nwes`
  String get news {
    return Intl.message(
      'Nwes',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Please answer a few questions. It’s very important to us`
  String get pleaseAnswe {
    return Intl.message(
      'Please answer a few questions. It’s very important to us',
      name: 'pleaseAnswe',
      desc: '',
      args: [],
    );
  }

  /// `Step 1 of 5`
  String get Step1 {
    return Intl.message(
      'Step 1 of 5',
      name: 'Step1',
      desc: '',
      args: [],
    );
  }

  /// `Step 2 of 5`
  String get Step2 {
    return Intl.message(
      'Step 2 of 5',
      name: 'Step2',
      desc: '',
      args: [],
    );
  }

  /// `Your personal information`
  String get personalInformation {
    return Intl.message(
      'Your personal information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any Allergies?`
  String get doYouHaveAnyAllergies {
    return Intl.message(
      'Do you have any Allergies?',
      name: 'doYouHaveAnyAllergies',
      desc: '',
      args: [],
    );
  }

  /// `I don’t have Allergies`
  String get iDontHaveAllergies {
    return Intl.message(
      'I don’t have Allergies',
      name: 'iDontHaveAllergies',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Alergies`
  String get alergies {
    return Intl.message(
      'Alergies',
      name: 'alergies',
      desc: '',
      args: [],
    );
  }

  /// `Biological Sex`
  String get biologicalSex {
    return Intl.message(
      'Biological Sex',
      name: 'biologicalSex',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Please write your allergies if you have any`
  String get pleaseWriteYourAllergiesIfYouHaveAny {
    return Intl.message(
      'Please write your allergies if you have any',
      name: 'pleaseWriteYourAllergiesIfYouHaveAny',
      desc: '',
      args: [],
    );
  }

  /// `Your Pharmacy`
  String get yourPharmacy {
    return Intl.message(
      'Your Pharmacy',
      name: 'yourPharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Name`
  String get pharmacyName {
    return Intl.message(
      'Pharmacy Name',
      name: 'pharmacyName',
      desc: '',
      args: [],
    );
  }

  /// `Choose Pharmacy Name`
  String get choosePharmacyName {
    return Intl.message(
      'Choose Pharmacy Name',
      name: 'choosePharmacyName',
      desc: '',
      args: [],
    );
  }

  /// `Choose Pharmacy`
  String get choosePharmacy {
    return Intl.message(
      'Choose Pharmacy',
      name: 'choosePharmacy',
      desc: '',
      args: [],
    );
  }

  /// `If your pharmacy is not in the list, please write the name of your pharmacy here:`
  String get ifYourPharmacyIsNotITheList {
    return Intl.message(
      'If your pharmacy is not in the list, please write the name of your pharmacy here:',
      name: 'ifYourPharmacyIsNotITheList',
      desc: '',
      args: [],
    );
  }

  /// `List of pharmacies:`
  String get listOfPharmacies {
    return Intl.message(
      'List of pharmacies:',
      name: 'listOfPharmacies',
      desc: '',
      args: [],
    );
  }

  /// `Step 3 of 5`
  String get Step3 {
    return Intl.message(
      'Step 3 of 5',
      name: 'Step3',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get yourAddress {
    return Intl.message(
      'Your Address',
      name: 'yourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Address 2`
  String get address2 {
    return Intl.message(
      'Address 2',
      name: 'address2',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `State name`
  String get stateName {
    return Intl.message(
      'State name',
      name: 'stateName',
      desc: '',
      args: [],
    );
  }

  /// `Aspirin`
  String get aspirin {
    return Intl.message(
      'Aspirin',
      name: 'aspirin',
      desc: '',
      args: [],
    );
  }

  /// `Penicillin`
  String get penicillin {
    return Intl.message(
      'Penicillin',
      name: 'penicillin',
      desc: '',
      args: [],
    );
  }

  /// `Cephalosporins`
  String get cephalosporins {
    return Intl.message(
      'Cephalosporins',
      name: 'cephalosporins',
      desc: '',
      args: [],
    );
  }

  /// `Sulphonamides`
  String get sulfonamides {
    return Intl.message(
      'Sulphonamides',
      name: 'sulfonamides',
      desc: '',
      args: [],
    );
  }

  /// `Z-Pak`
  String get zPak {
    return Intl.message(
      'Z-Pak',
      name: 'zPak',
      desc: '',
      args: [],
    );
  }

  /// `Ibuprofen`
  String get ibuprofen {
    return Intl.message(
      'Ibuprofen',
      name: 'ibuprofen',
      desc: '',
      args: [],
    );
  }

  /// `NSAID`
  String get nsaid {
    return Intl.message(
      'NSAID',
      name: 'nsaid',
      desc: '',
      args: [],
    );
  }

  /// `Statins`
  String get statins {
    return Intl.message(
      'Statins',
      name: 'statins',
      desc: '',
      args: [],
    );
  }

  /// `Dairy`
  String get dairy {
    return Intl.message(
      'Dairy',
      name: 'dairy',
      desc: '',
      args: [],
    );
  }

  /// `Gluten`
  String get gluten {
    return Intl.message(
      'Gluten',
      name: 'gluten',
      desc: '',
      args: [],
    );
  }

  /// `Nuts`
  String get nuts {
    return Intl.message(
      'Nuts',
      name: 'nuts',
      desc: '',
      args: [],
    );
  }

  /// `Seafood`
  String get seafood {
    return Intl.message(
      'Seafood',
      name: 'seafood',
      desc: '',
      args: [],
    );
  }

  /// `Soy`
  String get soy {
    return Intl.message(
      'Soy',
      name: 'soy',
      desc: '',
      args: [],
    );
  }

  /// `Latex`
  String get latex {
    return Intl.message(
      'Latex',
      name: 'latex',
      desc: '',
      args: [],
    );
  }

  /// `Anesthesia`
  String get anesthesia {
    return Intl.message(
      'Anesthesia',
      name: 'anesthesia',
      desc: '',
      args: [],
    );
  }

  /// `Contrast dye`
  String get contrastDye {
    return Intl.message(
      'Contrast dye',
      name: 'contrastDye',
      desc: '',
      args: [],
    );
  }

  /// `Insect Stings`
  String get insectStings {
    return Intl.message(
      'Insect Stings',
      name: 'insectStings',
      desc: '',
      args: [],
    );
  }

  /// `Tetanus Vaccine`
  String get tetanusVaccine {
    return Intl.message(
      'Tetanus Vaccine',
      name: 'tetanusVaccine',
      desc: '',
      args: [],
    );
  }

  /// `Influenza Vaccine`
  String get influenzaVaccine {
    return Intl.message(
      'Influenza Vaccine',
      name: 'influenzaVaccine',
      desc: '',
      args: [],
    );
  }

  /// `Choose State`
  String get chooseState {
    return Intl.message(
      'Choose State',
      name: 'chooseState',
      desc: '',
      args: [],
    );
  }

  /// `Step 4 of 5`
  String get step4 {
    return Intl.message(
      'Step 4 of 5',
      name: 'step4',
      desc: '',
      args: [],
    );
  }

  /// `Please upload photos of your insurance (front and back sides)`
  String get pleaseUploadPhotos {
    return Intl.message(
      'Please upload photos of your insurance (front and back sides)',
      name: 'pleaseUploadPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Photo of your insurance (front side)`
  String get insuranceFrontSide {
    return Intl.message(
      'Photo of your insurance (front side)',
      name: 'insuranceFrontSide',
      desc: '',
      args: [],
    );
  }

  /// `Photo of your insurance (back side)`
  String get insuranceBackSide {
    return Intl.message(
      'Photo of your insurance (back side)',
      name: 'insuranceBackSide',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get addPhoto {
    return Intl.message(
      'Add photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Please write the medications name`
  String get pleaseWriteTheMdicationsName {
    return Intl.message(
      'Please write the medications name',
      name: 'pleaseWriteTheMdicationsName',
      desc: '',
      args: [],
    );
  }

  /// `Step 6 of 7`
  String get step6 {
    return Intl.message(
      'Step 6 of 7',
      name: 'step6',
      desc: '',
      args: [],
    );
  }

  /// `What medications are you currently taking?`
  String get whatMedicationsAreYouCurrentlyTaking {
    return Intl.message(
      'What medications are you currently taking?',
      name: 'whatMedicationsAreYouCurrentlyTaking',
      desc: '',
      args: [],
    );
  }

  /// `Anxiety`
  String get anxiety {
    return Intl.message(
      'Anxiety',
      name: 'anxiety',
      desc: '',
      args: [],
    );
  }

  /// `Asthma`
  String get asthma {
    return Intl.message(
      'Asthma',
      name: 'asthma',
      desc: '',
      args: [],
    );
  }

  /// `Autoimmune Disorde`
  String get autoimmuneDisorde {
    return Intl.message(
      'Autoimmune Disorde',
      name: 'autoimmuneDisorde',
      desc: '',
      args: [],
    );
  }

  /// `Cancer`
  String get cancer {
    return Intl.message(
      'Cancer',
      name: 'cancer',
      desc: '',
      args: [],
    );
  }

  /// `COPD`
  String get cOPD {
    return Intl.message(
      'COPD',
      name: 'cOPD',
      desc: '',
      args: [],
    );
  }

  /// `Depression`
  String get depression {
    return Intl.message(
      'Depression',
      name: 'depression',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message(
      'Diabetes',
      name: 'diabetes',
      desc: '',
      args: [],
    );
  }

  /// `Heart Attack`
  String get heartAttack {
    return Intl.message(
      'Heart Attack',
      name: 'heartAttack',
      desc: '',
      args: [],
    );
  }

  /// `Heart Disease`
  String get heartDisease {
    return Intl.message(
      'Heart Disease',
      name: 'heartDisease',
      desc: '',
      args: [],
    );
  }

  /// `High Blood Pressure`
  String get highBloodPressure {
    return Intl.message(
      'High Blood Pressure',
      name: 'highBloodPressure',
      desc: '',
      args: [],
    );
  }

  /// `High Cholesterol`
  String get highCholesterol {
    return Intl.message(
      'High Cholesterol',
      name: 'highCholesterol',
      desc: '',
      args: [],
    );
  }

  /// `HIV/AIDS`
  String get hIVAIDS {
    return Intl.message(
      'HIV/AIDS',
      name: 'hIVAIDS',
      desc: '',
      args: [],
    );
  }

  /// `Kidney Disease`
  String get kidneyDisease {
    return Intl.message(
      'Kidney Disease',
      name: 'kidneyDisease',
      desc: '',
      args: [],
    );
  }

  /// `Liver Disease`
  String get liverDisease {
    return Intl.message(
      'Liver Disease',
      name: 'liverDisease',
      desc: '',
      args: [],
    );
  }

  /// `Migraines`
  String get migraines {
    return Intl.message(
      'Migraines',
      name: 'migraines',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any of the following medical conditions?`
  String get DoYouHaveAnyOfTheFollowingMedicalConditions {
    return Intl.message(
      'Do you have any of the following medical conditions?',
      name: 'DoYouHaveAnyOfTheFollowingMedicalConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please type any other medical condition here`
  String get pleaseTypeAnyOtherMedicalConditionHere {
    return Intl.message(
      'Please type any other medical condition here',
      name: 'pleaseTypeAnyOtherMedicalConditionHere',
      desc: '',
      args: [],
    );
  }

  /// `Step 7 of 7`
  String get step7 {
    return Intl.message(
      'Step 7 of 7',
      name: 'step7',
      desc: '',
      args: [],
    );
  }

  /// `Photo of your driver's license (front side)`
  String get photoOfYourDriversLicenseFrontSide {
    return Intl.message(
      'Photo of your driver\'s license (front side)',
      name: 'photoOfYourDriversLicenseFrontSide',
      desc: '',
      args: [],
    );
  }

  /// `Photo of your driver's license (back side)`
  String get photoOfYourDriversLicenseBackSide {
    return Intl.message(
      'Photo of your driver\'s license (back side)',
      name: 'photoOfYourDriversLicenseBackSide',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any notifications`
  String get youDontHaveAnyNotifications {
    return Intl.message(
      'You don’t have any notifications',
      name: 'youDontHaveAnyNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `'Error loading notifications`
  String get errorLoadingNotifications {
    return Intl.message(
      '\'Error loading notifications',
      name: 'errorLoadingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Error loading news`
  String get errorLoadingNews {
    return Intl.message(
      'Error loading news',
      name: 'errorLoadingNews',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this notification?`
  String get areYouSureYouWantToDeleteThisNotification {
    return Intl.message(
      'Are you sure you want to delete this notification?',
      name: 'areYouSureYouWantToDeleteThisNotification',
      desc: '',
      args: [],
    );
  }

  /// `If you delete it, you won't be able to restore it`
  String get ifYouDeleteItYouWontBeAbleToRestoreIt {
    return Intl.message(
      'If you delete it, you won\'t be able to restore it',
      name: 'ifYouDeleteItYouWontBeAbleToRestoreIt',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `'Error loading history`
  String get errorLoadingHistory {
    return Intl.message(
      '\'Error loading history',
      name: 'errorLoadingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Virtual Assistant`
  String get virtualAssistant {
    return Intl.message(
      'Virtual Assistant',
      name: 'virtualAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Medical records`
  String get medicalRecords {
    return Intl.message(
      'Medical records',
      name: 'medicalRecords',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Visual Summary`
  String get visualSummary {
    return Intl.message(
      'Visual Summary',
      name: 'visualSummary',
      desc: '',
      args: [],
    );
  }

  /// `Upload new document`
  String get uploadNewDocument {
    return Intl.message(
      'Upload new document',
      name: 'uploadNewDocument',
      desc: '',
      args: [],
    );
  }

  /// `Document upload`
  String get documentUpload {
    return Intl.message(
      'Document upload',
      name: 'documentUpload',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Title:`
  String get title {
    return Intl.message(
      'Title:',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title2 {
    return Intl.message(
      'Title',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Choose the category`
  String get chooseTheCategory {
    return Intl.message(
      'Choose the category',
      name: 'chooseTheCategory',
      desc: '',
      args: [],
    );
  }

  /// `Document category`
  String get documentCategory {
    return Intl.message(
      'Document category',
      name: 'documentCategory',
      desc: '',
      args: [],
    );
  }

  /// `Choose the category:`
  String get chooseTheCategory2 {
    return Intl.message(
      'Choose the category:',
      name: 'chooseTheCategory2',
      desc: '',
      args: [],
    );
  }

  /// `Choose category`
  String get chooseCategory {
    return Intl.message(
      'Choose category',
      name: 'chooseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Labs`
  String get labs {
    return Intl.message(
      'Labs',
      name: 'labs',
      desc: '',
      args: [],
    );
  }

  /// `Imaging`
  String get imaging {
    return Intl.message(
      'Imaging',
      name: 'imaging',
      desc: '',
      args: [],
    );
  }

  /// `Office visits/consult notes`
  String get officeVisits {
    return Intl.message(
      'Office visits/consult notes',
      name: 'officeVisits',
      desc: '',
      args: [],
    );
  }

  /// `Immunization record`
  String get immunizationRecord {
    return Intl.message(
      'Immunization record',
      name: 'immunizationRecord',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Date:`
  String get date {
    return Intl.message(
      'Date:',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `MM/DD/YYYY`
  String get MMDDYYYY {
    return Intl.message(
      'MM/DD/YYYY',
      name: 'MMDDYYYY',
      desc: '',
      args: [],
    );
  }

  /// `Category:`
  String get category {
    return Intl.message(
      'Category:',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Your document has been successfully uploaded`
  String get yourDocumentHasBeenSuccessfullyUploaded {
    return Intl.message(
      'Your document has been successfully uploaded',
      name: 'yourDocumentHasBeenSuccessfullyUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'chooseTheMode:' key

  /// `You do not have any uploaded documents right now`
  String get youDoNotHaveAnyUploadedDocumentsRightNow {
    return Intl.message(
      'You do not have any uploaded documents right now',
      name: 'youDoNotHaveAnyUploadedDocumentsRightNow',
      desc: '',
      args: [],
    );
  }

  /// `We did not find anything for your request. Please, try again`
  String get weDidNotFindAnythingForYourRequest {
    return Intl.message(
      'We did not find anything for your request. Please, try again',
      name: 'weDidNotFindAnythingForYourRequest',
      desc: '',
      args: [],
    );
  }

  /// `Document actions`
  String get documentActions {
    return Intl.message(
      'Document actions',
      name: 'documentActions',
      desc: '',
      args: [],
    );
  }

  /// `Sort documents`
  String get sortDocuments {
    return Intl.message(
      'Sort documents',
      name: 'sortDocuments',
      desc: '',
      args: [],
    );
  }

  /// `new documents first`
  String get newDocumentsFirst {
    return Intl.message(
      'new documents first',
      name: 'newDocumentsFirst',
      desc: '',
      args: [],
    );
  }

  /// `old documents first`
  String get oldDocumentsFirst {
    return Intl.message(
      'old documents first',
      name: 'oldDocumentsFirst',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personalInfo {
    return Intl.message(
      'Personal information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `My documents`
  String get myDocuments {
    return Intl.message(
      'My documents',
      name: 'myDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Medical information`
  String get medicalInformation {
    return Intl.message(
      'Medical information',
      name: 'medicalInformation',
      desc: '',
      args: [],
    );
  }

  /// `My Physicians`
  String get myPhysicians {
    return Intl.message(
      'My Physicians',
      name: 'myPhysicians',
      desc: '',
      args: [],
    );
  }

  /// `account management`
  String get accountManagement {
    return Intl.message(
      'account management',
      name: 'accountManagement',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Delete profile`
  String get deleteProfile {
    return Intl.message(
      'Delete profile',
      name: 'deleteProfile',
      desc: '',
      args: [],
    );
  }

  /// `Choose the date:`
  String get chooseTheDate {
    return Intl.message(
      'Choose the date:',
      name: 'chooseTheDate',
      desc: '',
      args: [],
    );
  }

  /// `share`
  String get share {
    return Intl.message(
      'share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get deleteSmol {
    return Intl.message(
      'delete',
      name: 'deleteSmol',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `security`
  String get security {
    return Intl.message(
      'security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Voice assistant`
  String get voiceAssistant {
    return Intl.message(
      'Voice assistant',
      name: 'voiceAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Change shortcut code`
  String get changeShortcutCode {
    return Intl.message(
      'Change shortcut code',
      name: 'changeShortcutCode',
      desc: '',
      args: [],
    );
  }

  /// `Login with face id / touch id`
  String get loginWithDaceId {
    return Intl.message(
      'Login with face id / touch id',
      name: 'loginWithDaceId',
      desc: '',
      args: [],
    );
  }

  /// `info`
  String get info {
    return Intl.message(
      'info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Share WellAi App`
  String get shareWellAiApp {
    return Intl.message(
      'Share WellAi App',
      name: 'shareWellAiApp',
      desc: '',
      args: [],
    );
  }

  /// `Rate the app`
  String get rateTheApp {
    return Intl.message(
      'Rate the app',
      name: 'rateTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Turn off shortcut code`
  String get turnOffShortcutCode {
    return Intl.message(
      'Turn off shortcut code',
      name: 'turnOffShortcutCode',
      desc: '',
      args: [],
    );
  }

  /// `App version`
  String get appVersion {
    return Intl.message(
      'App version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `1.0.0 (34)`
  String get version {
    return Intl.message(
      '1.0.0 (34)',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Our Contacts`
  String get ourContacts {
    return Intl.message(
      'Our Contacts',
      name: 'ourContacts',
      desc: '',
      args: [],
    );
  }

  /// `Address:`
  String get addressUs {
    return Intl.message(
      'Address:',
      name: 'addressUs',
      desc: '',
      args: [],
    );
  }

  /// `3550 Parkwood Blvd, Ste 600, Frisco, TX 75034`
  String get addressUs2 {
    return Intl.message(
      '3550 Parkwood Blvd, Ste 600, Frisco, TX 75034',
      name: 'addressUs2',
      desc: '',
      args: [],
    );
  }

  /// `Opening hours:`
  String get openingHours {
    return Intl.message(
      'Opening hours:',
      name: 'openingHours',
      desc: '',
      args: [],
    );
  }

  /// `Monday - Friday 8:30AM-5:30PM`
  String get openingHours2 {
    return Intl.message(
      'Monday - Friday 8:30AM-5:30PM',
      name: 'openingHours2',
      desc: '',
      args: [],
    );
  }

  /// `Phone:`
  String get phone {
    return Intl.message(
      'Phone:',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `(972) 377-8800`
  String get phone2 {
    return Intl.message(
      '(972) 377-8800',
      name: 'phone2',
      desc: '',
      args: [],
    );
  }

  /// `Useful Links`
  String get usefulLinks {
    return Intl.message(
      'Useful Links',
      name: 'usefulLinks',
      desc: '',
      args: [],
    );
  }

  /// `Our Email`
  String get ourEmail {
    return Intl.message(
      'Our Email',
      name: 'ourEmail',
      desc: '',
      args: [],
    );
  }

  /// `BentTreeFamilyPhysiciants@gmail.com`
  String get ourEmail2 {
    return Intl.message(
      'BentTreeFamilyPhysiciants@gmail.com',
      name: 'ourEmail2',
      desc: '',
      args: [],
    );
  }

  /// `Our Website`
  String get ourWebsite {
    return Intl.message(
      'Our Website',
      name: 'ourWebsite',
      desc: '',
      args: [],
    );
  }

  /// `https://www.benttreemd.com`
  String get ourWebsite2 {
    return Intl.message(
      'https://www.benttreemd.com',
      name: 'ourWebsite2',
      desc: '',
      args: [],
    );
  }

  /// `Set photo`
  String get setPhoto {
    return Intl.message(
      'Set photo',
      name: 'setPhoto',
      desc: '',
      args: [],
    );
  }

  /// `General information`
  String get generalInformation {
    return Intl.message(
      'General information',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Contact information`
  String get contactInformation {
    return Intl.message(
      'Contact information',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy phone`
  String get pharmacyPhone {
    return Intl.message(
      'Pharmacy phone',
      name: 'pharmacyPhone',
      desc: '',
      args: [],
    );
  }

  /// `My clinic`
  String get myClinic {
    return Intl.message(
      'My clinic',
      name: 'myClinic',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `personal information`
  String get personalInformationS {
    return Intl.message(
      'personal information',
      name: 'personalInformationS',
      desc: '',
      args: [],
    );
  }

  /// `Take photo`
  String get takePhoto {
    return Intl.message(
      'Take photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo`
  String get choosePhoto {
    return Intl.message(
      'Choose photo',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Edit photo`
  String get editPhoto {
    return Intl.message(
      'Edit photo',
      name: 'editPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Driver's license`
  String get driversLicense {
    return Intl.message(
      'Driver\'s license',
      name: 'driversLicense',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `Your document has not been loaded yet. Please upload photos of your insurance (front and back sides)`
  String get yourDocumentHasNotBeenLoadedYet {
    return Intl.message(
      'Your document has not been loaded yet. Please upload photos of your insurance (front and back sides)',
      name: 'yourDocumentHasNotBeenLoadedYet',
      desc: '',
      args: [],
    );
  }

  /// `Driver’s license (front side)`
  String get driversLicenseFront {
    return Intl.message(
      'Driver’s license (front side)',
      name: 'driversLicenseFront',
      desc: '',
      args: [],
    );
  }

  /// `Driver’s license (back side)`
  String get driversLicenseBack {
    return Intl.message(
      'Driver’s license (back side)',
      name: 'driversLicenseBack',
      desc: '',
      args: [],
    );
  }

  /// `Insurance (front side)`
  String get insuranceFrontSide2 {
    return Intl.message(
      'Insurance (front side)',
      name: 'insuranceFrontSide2',
      desc: '',
      args: [],
    );
  }

  /// `Insurance (back side)`
  String get insuranceBackSide2 {
    return Intl.message(
      'Insurance (back side)',
      name: 'insuranceBackSide2',
      desc: '',
      args: [],
    );
  }

  /// `Add Physician`
  String get addPhysician {
    return Intl.message(
      'Add Physician',
      name: 'addPhysician',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Qualififcation`
  String get qualififcation {
    return Intl.message(
      'Qualififcation',
      name: 'qualififcation',
      desc: '',
      args: [],
    );
  }

  /// `Choose the Qualification:`
  String get chooseQualification {
    return Intl.message(
      'Choose the Qualification:',
      name: 'chooseQualification',
      desc: '',
      args: [],
    );
  }

  /// `Choose qualification`
  String get chooseQualification2 {
    return Intl.message(
      'Choose qualification',
      name: 'chooseQualification2',
      desc: '',
      args: [],
    );
  }

  /// `Sort physicians`
  String get sortPhysicians {
    return Intl.message(
      'Sort physicians',
      name: 'sortPhysicians',
      desc: '',
      args: [],
    );
  }

  /// `From A to Z`
  String get fromAtoZ {
    return Intl.message(
      'From A to Z',
      name: 'fromAtoZ',
      desc: '',
      args: [],
    );
  }

  /// `From Z to A`
  String get fromZtoA {
    return Intl.message(
      'From Z to A',
      name: 'fromZtoA',
      desc: '',
      args: [],
    );
  }

  /// `Last added`
  String get lastAdded {
    return Intl.message(
      'Last added',
      name: 'lastAdded',
      desc: '',
      args: [],
    );
  }

  /// `First added`
  String get firstAdded {
    return Intl.message(
      'First added',
      name: 'firstAdded',
      desc: '',
      args: [],
    );
  }

  /// `Edit physician`
  String get editditPhysician {
    return Intl.message(
      'Edit physician',
      name: 'editditPhysician',
      desc: '',
      args: [],
    );
  }

  /// `Delete physician`
  String get deletePhysician {
    return Intl.message(
      'Delete physician',
      name: 'deletePhysician',
      desc: '',
      args: [],
    );
  }

  /// `Your comment (optional)`
  String get yourComment {
    return Intl.message(
      'Your comment (optional)',
      name: 'yourComment',
      desc: '',
      args: [],
    );
  }

  /// `Add photo or document`
  String get addPhotoOr {
    return Intl.message(
      'Add photo or document',
      name: 'addPhotoOr',
      desc: '',
      args: [],
    );
  }

  /// `TeleHealth`
  String get teleHealth {
    return Intl.message(
      'TeleHealth',
      name: 'teleHealth',
      desc: '',
      args: [],
    );
  }

  /// `Available providers`
  String get availableProviders {
    return Intl.message(
      'Available providers',
      name: 'availableProviders',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Choose this doctor`
  String get chooseThisDoctor {
    return Intl.message(
      'Choose this doctor',
      name: 'chooseThisDoctor',
      desc: '',
      args: [],
    );
  }

  /// `You can sign up for a TeleHealth by filling out the form below:`
  String get teleHealthByFillingOut {
    return Intl.message(
      'You can sign up for a TeleHealth by filling out the form below:',
      name: 'teleHealthByFillingOut',
      desc: '',
      args: [],
    );
  }

  /// `Sign up for a call`
  String get signupForaCall {
    return Intl.message(
      'Sign up for a call',
      name: 'signupForaCall',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `The list of doctors is not ready yet. Please try to visit this page later`
  String get listOfDoctorsIsNotReady {
    return Intl.message(
      'The list of doctors is not ready yet. Please try to visit this page later',
      name: 'listOfDoctorsIsNotReady',
      desc: '',
      args: [],
    );
  }

  /// `Symptoms from Assistant:`
  String get symptomsfromassistant {
    return Intl.message(
      'Symptoms from Assistant:',
      name: 'symptomsfromassistant',
      desc: '',
      args: [],
    );
  }

  /// `Show patient’s card`
  String get showpatientscard {
    return Intl.message(
      'Show patient’s card',
      name: 'showpatientscard',
      desc: '',
      args: [],
    );
  }

  /// ` clear all`
  String get clearAll {
    return Intl.message(
      ' clear all',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neww {
    return Intl.message(
      'New',
      name: 'neww',
      desc: '',
      args: [],
    );
  }

  /// `Earlier`
  String get earlier {
    return Intl.message(
      'Earlier',
      name: 'earlier',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get patients {
    return Intl.message(
      'Patients',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `Leave notes`
  String get leaveNotes {
    return Intl.message(
      'Leave notes',
      name: 'leaveNotes',
      desc: '',
      args: [],
    );
  }

  /// `The calendar has not been updated yet.`
  String get theCalendarHasNotBeenUpdatedYet {
    return Intl.message(
      'The calendar has not been updated yet.',
      name: 'theCalendarHasNotBeenUpdatedYet',
      desc: '',
      args: [],
    );
  }

  /// `Please try to visit this page later`
  String get pleaseTryToVisitThisPageLater {
    return Intl.message(
      'Please try to visit this page later',
      name: 'pleaseTryToVisitThisPageLater',
      desc: '',
      args: [],
    );
  }

  /// ` Error loading calendar`
  String get errorLoadingCalendar {
    return Intl.message(
      ' Error loading calendar',
      name: 'errorLoadingCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Enter the patient's name...`
  String get EnterThePatientName {
    return Intl.message(
      'Enter the patient\'s name...',
      name: 'EnterThePatientName',
      desc: '',
      args: [],
    );
  }

  /// `Choose the mode:`
  String get chooseTheMode {
    return Intl.message(
      'Choose the mode:',
      name: 'chooseTheMode',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
