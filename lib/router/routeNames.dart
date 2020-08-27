class RouteNames {
  static const String Splash = '/';
  static const String Home = '/home';

  // hotel
  static const String CreateHotel = '/hotel/create';
  static const String SelectHotel = '/hotel/select';

  // auth
  static const String Login = '/auth/login';
  static const String ChangeUserInfo = '/auth/changeUserInfo';
  static const String SignUp = '/auth/signup';

  // home navigator
  static const String Issues = '/home/issues';
  static const String TeamIssues = '/home/teamIsseus';
  static const String Notices = '/home/notices';
  static const String Menus = '/home/menus';

  // modal
  static const String FilterModal = '/filterModal';
  static const String SelectTeamModal = '/selectTeamModal';
  static const String SelectCategoryModal = '/selectCategoryModal';

  // issue
  static const String IssueFilterModal = '/issue/filterModal';
  static const String IssueDetail = '/issue/detail';
  static const String WriteIssue = '/issue/write';
  static const String SelectListItem = '/selectListItem';
  static const String ReservedIssue = '/issue/reserved';

  // notice
  static const String NoticeFilterModal = '/notice/filterModal';
  static const String WriteNotice = '/notice/write';
  static const String NoticeDetail = '/notice/detail';

  // image
  static const String ImageDetailModal = '/imageDetailModal';

  // user
  static const String MemberList = '/users';
  static const String ReadMemberList = '/readMembers';

  // note
  static const String NoteList = '/note';
  static const String NoteDetail = '/note/detail';

  // room
  // static const String RoomList = '/rooms';
  // static const String RoomDetail = '/room/detail';

  // settings
  static const String Settings = '/settings';

  // help center
  static const String HelpCenter = '/helpCenter';

  // changeLog
  static const String ChangeLog = '/changeLogs';

  static const List<String> HomeNavigationNameList = [
    TeamIssues,
    Issues,
    Notices,
    Menus,
  ];
}
