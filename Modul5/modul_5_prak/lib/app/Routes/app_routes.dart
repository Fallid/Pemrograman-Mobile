part of "app_pages.dart";

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const PROFILE = _Paths.PROFILE;
  static const TRENDING = _Paths.TRENDING;
  static const NEWS = _Paths.NEWS;
  static const REGISTER = _Paths.REGISTER;
  static const LOGIN = _Paths.LOGIN;
  static const DISCUSSION = _Paths.DISCUSSION;
  static const FORUM = _Paths.FORUM;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = "/home";
  static const NOTIFICATION = "/notification";
  static const PROFILE = '/profile';
  static const TRENDING = "/trending";
  static const NEWS = "/news";
  static const REGISTER = "/register";
  static const LOGIN = "/login";
  static const DISCUSSION = "/discussion";
  static const FORUM = "/forum";
}
