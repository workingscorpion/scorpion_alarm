import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/pages/addAlarm.dart';
import 'package:scorpion_alarm_app/pages/home.dart';
import 'package:scorpion_alarm_app/pages/splash.dart';
import 'package:scorpion_alarm_app/router/routeNames.dart';
import 'package:scorpion_alarm_app/stores/navigationStore.dart';
// import 'package:mobx/mobx.dart';
// import 'package:scorpion_alarm_app/pages/settings/settingsPage.dart';

class Router {
  static NavigationStore get _navigationStore => NavigationStore.instance;

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Splash:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
          settings: settings,
        );

      case RouteNames.Home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );

      case RouteNames.Add:
        return MaterialPageRoute(
          builder: (context) => AddAlarmPage(),
          settings: settings,
        );

      //   case RouteNames.Login:
      //     return MaterialPageRoute(
      //       builder: (context) => LoginPage(),
      //       settings: settings,
      //     );

      //   case RouteNames.SelectHotel:
      //     return MaterialPageRoute(
      //       builder: (context) => SelectHotelPage(),
      //       settings: settings,
      //     );

      //   case RouteNames.IssueDetail:
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         IssueStore.instance.issueDetailPageKey =
      //             GlobalKey<IssueDetailPageState>();

      //         return IssueDetailPage(
      //           key: IssueStore.instance.issueDetailPageKey,
      //           issueObjectId: settings.arguments,
      //         );
      //       },
      //       settings: settings,
      //     );

      //   case RouteNames.WriteIssue:
      //     return MaterialPageRoute(
      //       builder: (context) =>
      //           WriteIssuePage(issueObjectId: settings.arguments),
      //       settings: settings,
      //     );

      //   case RouteNames.NoticeDetail:
      //     return MaterialPageRoute(
      //       builder: (context) =>
      //           NoticeDetailPage(noticeObjectId: settings.arguments),
      //       settings: settings,
      //     );

      //   case RouteNames.FilterModal:
      //     return TopDownModalRoute(
      //       builder: (context) => FilterModal(store: settings.arguments),
      //     );

      //   case RouteNames.SelectCategoryModal:
      //     return MaterialPageRoute(
      //       builder: (context) => SelectCategoryModal(),
      //       settings: settings,
      //     );

      //   case RouteNames.SelectTeamModal:
      //     final arguments = settings.arguments as Map;
      //     return MaterialPageRoute(
      //       builder: (context) => SelectTeamModal(
      //         maxCount: arguments['maxCount'],
      //         teamObjectIds: arguments['teamObjectIds'],
      //         selectedTeamObjectIds: arguments['selectedTeamObjectIds'],
      //       ),
      //       settings: settings,
      //     );

      //   case RouteNames.ReservedIssue:
      //     return MaterialPageRoute(
      //       builder: (context) => ReservedIssuePage(),
      //       settings: settings,
      //     );

      //   case RouteNames.MemberList:
      //     return MaterialPageRoute(
      //       builder: (context) => MemberListPage(),
      //       settings: settings,
      //     );

      //   case RouteNames.NoteList:
      //     return MaterialPageRoute(
      //       builder: (context) => NoteListPage(),
      //       settings: settings,
      //     );

      //   case RouteNames.NoteDetail:
      //     return MaterialPageRoute(
      //       builder: (context) =>
      //           NoteDetailPage(noteObjectId: settings.arguments),
      //       settings: settings,
      //     );

      //   case RouteNames.WriteNotice:
      //     return MaterialPageRoute(
      //       builder: (context) =>
      //           WriteNoticePage(noticeObjectId: settings.arguments),
      //       settings: settings,
      //     );

      //   case RouteNames.Settings:
      //     return MaterialPageRoute(
      //       builder: (context) => SettingsPage(),
      //       settings: settings,
      //     );

      //   case RouteNames.HelpCenter:
      //     return MaterialPageRoute(
      //       builder: (context) => HelpCenterPage(),
      //       settings: settings,
      //     );

      //   default:
      //     return MaterialPageRoute(
      //       builder: (context) => SplashPage(),
      //       settings: settings,
      //     );
    }
  }

  // static toLogin() => _navigationStore.reset(RouteNames.Login);

  static toHome() => _navigationStore.reset(RouteNames.Home);

  static toAdd() => _navigationStore.push(RouteNames.Add);

  // static toSelectHotel() => _navigationStore.reset(RouteNames.SelectHotel);

  // static toWriteIssue({String issueObjectId}) => _navigationStore.push(
  //       RouteNames.WriteIssue,
  //       arguments: issueObjectId,
  //     );

  // static openFilter(Store store) =>
  //     _navigationStore.push(RouteNames.FilterModal, arguments: store);

  // static openSelectCategoryModal() =>
  //     _navigationStore.push(RouteNames.SelectCategoryModal);

  // static openSelectTeamModal({
  //   int maxCount,
  //   List<String> teamObjectIds,
  //   List<String> selectedTeamObjectIds,
  // }) =>
  //     _navigationStore.push(
  //       RouteNames.SelectTeamModal,
  //       arguments: {
  //         'maxCount': maxCount,
  //         'teamObjectIds': teamObjectIds,
  //         'selectedTeamObjectIds': selectedTeamObjectIds,
  //       },
  //     );

  // static toIssueDetail(String issueObjectId) {
  //   if (_navigationStore.currentRouteName == RouteNames.IssueDetail) {
  //     _navigationStore.reset(
  //       RouteNames.IssueDetail,
  //       predicate: (router) => router.settings.name == RouteNames.Home,
  //       arguments: issueObjectId,
  //     );
  //   } else {
  //     _navigationStore.push(
  //       RouteNames.IssueDetail,
  //       arguments: issueObjectId,
  //     );
  //   }
  // }

  // static toNoticeDetail(String noticeObjectId) {
  //   if (_navigationStore.currentRouteName == RouteNames.NoticeDetail) {
  //     _navigationStore.reset(
  //       RouteNames.NoticeDetail,
  //       predicate: (router) => router.settings.name == RouteNames.Home,
  //       arguments: noticeObjectId,
  //     );
  //   } else {
  //     _navigationStore.push(
  //       RouteNames.NoticeDetail,
  //       arguments: noticeObjectId,
  //     );
  //   }
  // }

  // static toReservedIssue() => _navigationStore.push(RouteNames.ReservedIssue);

  // static toMemberList() => _navigationStore.push(RouteNames.MemberList);

  // static toNoteList() => _navigationStore.push(RouteNames.NoteList);

  // static toNoteDetail({String noteObjectId}) => _navigationStore.push(
  //       RouteNames.NoteDetail,
  //       arguments: noteObjectId,
  //     );

  // static toWriteNotice({String noticeObjectId}) => _navigationStore.push(
  //       RouteNames.WriteNotice,
  //       arguments: noticeObjectId,
  //     );

  // static toSettings() => _navigationStore.push(RouteNames.Settings);

  // static toHelpCenter() => _navigationStore.push(RouteNames.HelpCenter);

  // static pop() => _navigationStore.pop();
}
