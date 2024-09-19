/// Enumerates the various translatable strings used within the application.
enum TranslationKey {
  about,
  add,
  admin,
  analytics,
  appDescription,
  apply,
  appTitle,
  back,
  calendar,
  cancel,
  changeLocale,
  choose,
  clear,
  close,
  confirm,
  contactUs,
  continueString,
  country,
  darkMode,
  dashboard,
  delete,
  done,
  edit,
  en,
  end,
  fa,
  filter,
  firstName,
  firstNameHint,
  forgotPassword,
  groupOverview,
  groups,
  help,
  home,
  ir,
  language,
  lastName,
  lastNameHint,
  lightMode,
  login,
  logout,
  member,
  memberForm,
  memberOverview,
  members,
  messages,
  name,
  next,
  no,
  notifications,
  ok,
  phoneNumber,
  phoneNumberHint,
  previous,
  privacyPolicy,
  profile,
  projects,
  register,
  reports,
  reset,
  resetPassword,
  save,
  saveChanges,
  search,
  select,
  settings,
  settingsTitle,
  skip,
  sort,
  start,
  submit,
  tasks,
  termsAndConditions,
  themeMode,
  us,
  user,
  userStatus,
  yes,
}

/// Provides a blueprint for classes that offer translations for predefined keys.
/// Each translation class must implement this interface to ensure consistency.
///
/// To add a new translation:
///   1. Add the new key to the [TranslationKey] enum:
///     ```dart
///     enum TranslationKey {
///       // ... existing keys
///       yourNewKey,
///     }
///     ```
///   2. Add a corresponding getter to the [TranslationProvider] interface:
///     ```dart
///     String get yourNewKey;
///     ```
///   3. Include the new key and its getter in the [toMap] method of [TranslationProvider]:
///     ```dart
///     Map<String, String> toMap() {
///       return {
///         // ... existing key-value pairs
///         TranslationKey.yourNewKey.name: yourNewKey,
///       };
///     }
///     ```
///   4. Finally, provide the translation for the new key in each language-specific implementation.
abstract class TranslationProvider {
  String get about;
  String get add;
  String get admin;
  String get analytics;
  String get appDescription;
  String get apply;
  String get appTitle;
  String get back;
  String get calendar;
  String get cancel;
  String get changeLocale;
  String get choose;
  String get clear;
  String get close;
  String get confirm;
  String get contactUs;
  String get continueString;
  String get country;
  String get darkMode;
  String get dashboard;
  String get delete;
  String get done;
  String get edit;
  String get en;
  String get end;
  String get fa;
  String get filter;
  String get firstName;
  String get firstNameHint;
  String get forgotPassword;
  String get groupOverview;
  String get groups;
  String get help;
  String get home;
  String get ir;
  String get language;
  String get lastName;
  String get lastNameHint;
  String get lightMode;
  String get login;
  String get logout;
  String get member;
  String get memberForm;
  String get memberOverview;
  String get members;
  String get messages;
  String get name;
  String get next;
  String get no;
  String get notifications;
  String get ok;
  String get phoneNumber;
  String get phoneNumberHint;
  String get previous;
  String get privacyPolicy;
  String get profile;
  String get projects;
  String get register;
  String get reports;
  String get reset;
  String get resetPassword;
  String get save;
  String get saveChanges;
  String get search;
  String get select;
  String get settings;
  String get settingsTitle;
  String get skip;
  String get sort;
  String get start;
  String get submit;
  String get tasks;
  String get termsAndConditions;
  String get themeMode;
  String get us;
  String get user;
  String get userStatus;
  String get yes;

  /// Transforms the translation keys and their corresponding values into a map.
  Map<String, String> toMap() {
    return {
      TranslationKey.about.name: about,
      TranslationKey.add.name: add,
      TranslationKey.admin.name: admin,
      TranslationKey.analytics.name: analytics,
      TranslationKey.appDescription.name: appDescription,
      TranslationKey.apply.name: apply,
      TranslationKey.appTitle.name: appTitle,
      TranslationKey.back.name: back,
      TranslationKey.calendar.name: calendar,
      TranslationKey.cancel.name: cancel,
      TranslationKey.changeLocale.name: changeLocale,
      TranslationKey.choose.name: choose,
      TranslationKey.clear.name: clear,
      TranslationKey.close.name: close,
      TranslationKey.confirm.name: confirm,
      TranslationKey.contactUs.name: contactUs,
      TranslationKey.continueString.name: continueString,
      TranslationKey.country.name: country,
      TranslationKey.darkMode.name: darkMode,
      TranslationKey.dashboard.name: dashboard,
      TranslationKey.delete.name: delete,
      TranslationKey.done.name: done,
      TranslationKey.edit.name: edit,
      TranslationKey.en.name: en,
      TranslationKey.end.name: end,
      TranslationKey.fa.name: fa,
      TranslationKey.filter.name: filter,
      TranslationKey.firstName.name: firstName,
      TranslationKey.firstNameHint.name: firstNameHint,
      TranslationKey.forgotPassword.name: forgotPassword,
      TranslationKey.groupOverview.name: groupOverview,
      TranslationKey.groups.name: groups,
      TranslationKey.help.name: help,
      TranslationKey.home.name: home,
      TranslationKey.ir.name: ir,
      TranslationKey.language.name: language,
      TranslationKey.lastName.name: lastName,
      TranslationKey.lastNameHint.name: lastNameHint,
      TranslationKey.lightMode.name: lightMode,
      TranslationKey.login.name: login,
      TranslationKey.logout.name: logout,
      TranslationKey.member.name: member,
      TranslationKey.memberForm.name: memberForm,
      TranslationKey.memberOverview.name: memberOverview,
      TranslationKey.members.name: members,
      TranslationKey.messages.name: messages,
      TranslationKey.name.name: name,
      TranslationKey.next.name: next,
      TranslationKey.no.name: no,
      TranslationKey.notifications.name: notifications,
      TranslationKey.ok.name: ok,
      TranslationKey.phoneNumber.name: phoneNumber,
      TranslationKey.phoneNumberHint.name: phoneNumberHint,
      TranslationKey.previous.name: previous,
      TranslationKey.privacyPolicy.name: privacyPolicy,
      TranslationKey.profile.name: profile,
      TranslationKey.projects.name: projects,
      TranslationKey.register.name: register,
      TranslationKey.reports.name: reports,
      TranslationKey.reset.name: reset,
      TranslationKey.resetPassword.name: resetPassword,
      TranslationKey.save.name: save,
      TranslationKey.saveChanges.name: saveChanges,
      TranslationKey.search.name: search,
      TranslationKey.select.name: select,
      TranslationKey.settings.name: settings,
      TranslationKey.settingsTitle.name: settingsTitle,
      TranslationKey.skip.name: skip,
      TranslationKey.sort.name: sort,
      TranslationKey.start.name: start,
      TranslationKey.submit.name: submit,
      TranslationKey.tasks.name: tasks,
      TranslationKey.termsAndConditions.name: termsAndConditions,
      TranslationKey.themeMode.name: themeMode,
      TranslationKey.us.name: us,
      TranslationKey.user.name: user,
      TranslationKey.userStatus.name: userStatus,
      TranslationKey.yes.name: yes,
    };
  }
}
