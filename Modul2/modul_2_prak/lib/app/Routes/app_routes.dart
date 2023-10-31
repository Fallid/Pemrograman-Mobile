part of "app_pages.dart";

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const PROFILE = _Paths.PROFILE;
  static const TRENDING = _Paths.TRENDING;
  static const NEWS = _Paths.NEWS;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = "/home";
  static const NOTIFICATION = "/notification";
  static const PROFILE = '/profile';
  static const TRENDING = "/trending";
  static const NEWS = "/news";
}
