// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:tankobon/views/dashboard.dart' as _i3;
import 'package:tankobon/views/decider.dart' as _i1;
import 'package:tankobon/views/login.dart' as _i2;
import 'package:tankobon/views/manga.dart' as _i4;
import 'package:tankobon/views/manga_list.dart' as _i6;
import 'package:tankobon/views/recent.dart' as _i5;
import 'package:tankobon/views/settings.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DeciderView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.DeciderView());
    },
    LoginView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    DashboardView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.DashboardView());
    },
    MangaView.name: (routeData) {
      final args = routeData.argsAs<MangaViewArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.MangaView(key: args.key, uuid: args.uuid));
    },
    RecentView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.RecentView());
    },
    MangaListView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.MangaListView());
    },
    SettingsView.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SettingsView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(DeciderView.name, path: '/'),
        _i8.RouteConfig(LoginView.name, path: '/login'),
        _i8.RouteConfig(DashboardView.name, path: '/dashboard', children: [
          _i8.RouteConfig(RecentView.name,
              path: '', parent: DashboardView.name),
          _i8.RouteConfig(MangaListView.name,
              path: 'manga-list-view', parent: DashboardView.name),
          _i8.RouteConfig(SettingsView.name,
              path: 'settings-view', parent: DashboardView.name)
        ]),
        _i8.RouteConfig(MangaView.name, path: '/dashboard/view/:uuid')
      ];
}

/// generated route for
/// [_i1.DeciderView]
class DeciderView extends _i8.PageRouteInfo<void> {
  const DeciderView() : super(DeciderView.name, path: '/');

  static const String name = 'DeciderView';
}

/// generated route for
/// [_i2.LoginView]
class LoginView extends _i8.PageRouteInfo<void> {
  const LoginView() : super(LoginView.name, path: '/login');

  static const String name = 'LoginView';
}

/// generated route for
/// [_i3.DashboardView]
class DashboardView extends _i8.PageRouteInfo<void> {
  const DashboardView({List<_i8.PageRouteInfo>? children})
      : super(DashboardView.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardView';
}

/// generated route for
/// [_i4.MangaView]
class MangaView extends _i8.PageRouteInfo<MangaViewArgs> {
  MangaView({_i9.Key? key, required String uuid})
      : super(MangaView.name,
            path: '/dashboard/view/:uuid',
            args: MangaViewArgs(key: key, uuid: uuid));

  static const String name = 'MangaView';
}

class MangaViewArgs {
  const MangaViewArgs({this.key, required this.uuid});

  final _i9.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'MangaViewArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i5.RecentView]
class RecentView extends _i8.PageRouteInfo<void> {
  const RecentView() : super(RecentView.name, path: '');

  static const String name = 'RecentView';
}

/// generated route for
/// [_i6.MangaListView]
class MangaListView extends _i8.PageRouteInfo<void> {
  const MangaListView() : super(MangaListView.name, path: 'manga-list-view');

  static const String name = 'MangaListView';
}

/// generated route for
/// [_i7.SettingsView]
class SettingsView extends _i8.PageRouteInfo<void> {
  const SettingsView() : super(SettingsView.name, path: 'settings-view');

  static const String name = 'SettingsView';
}
