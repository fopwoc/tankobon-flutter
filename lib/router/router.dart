import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/views/dashboard.dart';
import 'package:tankobon/views/decider.dart';
import 'package:tankobon/views/gallery.dart';
import 'package:tankobon/views/login.dart';
import 'package:tankobon/views/manga.dart';
import 'package:tankobon/views/manga_list.dart';
import 'package:tankobon/views/recent.dart';
import 'package:tankobon/views/settings.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: DeciderView, initial: true),
    AutoRoute(path: '/login', page: LoginView),
    AutoRoute(
      path: '/dashboard',
      page: DashboardView,
      children: [
        AutoRoute(page: RecentView),
        AutoRoute(page: MangaListView),
        AutoRoute(page: SettingsView),
      ],
    ),
    AutoRoute(path: '/dashboard/view/:uuid', page: MangaView),
    AutoRoute(
      path: '/dashboard/view/:uuid/:volume/:chapter',
      page: GalleryView,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
//class $AppRouter {}
