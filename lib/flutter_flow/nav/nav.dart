import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? const CheckupWidget()
          : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? const CheckupWidget()
              : const LoginWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'storekeeperHome',
          path: '/storekeeperHome',
          requireAuth: true,
          builder: (context, params) => const StorekeeperHomeWidget(),
        ),
        FFRoute(
          name: 'Home01CompanyList',
          path: '/home01CompanyList',
          builder: (context, params) => const Home01CompanyListWidget(),
        ),
        FFRoute(
          name: 'createUser',
          path: '/createUser',
          requireAuth: true,
          builder: (context, params) => const CreateUserWidget(),
        ),
        FFRoute(
          name: 'Missingtools_form',
          path: '/missingtoolsForm',
          requireAuth: true,
          asyncParams: {
            'supervisorDoc': getDoc(['users'], UsersRecord.fromSnapshot),
            'requestDec':
                getDoc(['Tools_Requests'], ToolsRequestsRecord.fromSnapshot),
          },
          builder: (context, params) => MissingtoolsFormWidget(
            supervisorDoc: params.getParam(
              'supervisorDoc',
              ParamType.Document,
            ),
            requestDec: params.getParam(
              'requestDec',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'day_Contract_List',
          path: '/dayContractList',
          requireAuth: true,
          builder: (context, params) => const DayContractListWidget(),
        ),
        FFRoute(
          name: 'request_Details',
          path: '/request_Details',
          requireAuth: true,
          builder: (context, params) => RequestDetailsWidget(
            supervisorRef: params.getParam(
              'supervisorRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            requestRef: params.getParam(
              'requestRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Tools_Requests'],
            ),
          ),
        ),
        FFRoute(
          name: 'createUser_2',
          path: '/createUser2',
          requireAuth: true,
          builder: (context, params) => CreateUser2Widget(
            nickName: params.getParam(
              'nickName',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            middleName: params.getParam(
              'middleName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            birthdate: params.getParam(
              'birthdate',
              ParamType.String,
            ),
            government: params.getParam(
              'government',
              ParamType.String,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
            fullAddress: params.getParam(
              'fullAddress',
              ParamType.String,
            ),
            socialStatus: params.getParam(
              'socialStatus',
              ParamType.String,
            ),
            employmentDate: params.getParam(
              'employmentDate',
              ParamType.String,
            ),
            frontNatImageUrl: params.getParam(
              'frontNatImageUrl',
              ParamType.String,
            ),
            backNatImageUrl: params.getParam(
              'backNatImageUrl',
              ParamType.String,
            ),
            drugTestImageUrl: params.getParam(
              'drugTestImageUrl',
              ParamType.String,
            ),
            frontDLic: params.getParam(
              'frontDLic',
              ParamType.String,
            ),
            backDLic: params.getParam(
              'backDLic',
              ParamType.String,
            ),
            startingShift: params.getParam(
              'startingShift',
              ParamType.String,
            ),
            shiftPeriod: params.getParam(
              'shiftPeriod',
              ParamType.String,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            contractorRef: params.getParam(
              'contractorRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['contractors'],
            ),
            nationalId: params.getParam(
              'nationalId',
              ParamType.String,
            ),
            natIssuePlace: params.getParam(
              'natIssuePlace',
              ParamType.String,
            ),
            natIssueDate: params.getParam(
              'natIssueDate',
              ParamType.String,
            ),
            natExpireDate: params.getParam(
              'natExpireDate',
              ParamType.String,
            ),
            nationality: params.getParam(
              'nationality',
              ParamType.String,
            ),
            drLicType: params.getParam(
              'drLicType',
              ParamType.String,
            ),
            drLicIssuePlace: params.getParam(
              'drLicIssuePlace',
              ParamType.String,
            ),
            drLicIssueDate: params.getParam(
              'drLicIssueDate',
              ParamType.String,
            ),
            drLicExpiryDate: params.getParam(
              'drLicExpiryDate',
              ParamType.String,
            ),
            totalDebit: params.getParam(
              'totalDebit',
              ParamType.double,
            ),
            totalCredit: params.getParam(
              'totalCredit',
              ParamType.double,
            ),
            diflictPercentage: params.getParam(
              'diflictPercentage',
              ParamType.double,
            ),
            shiftPrice: params.getParam(
              'shiftPrice',
              ParamType.double,
            ),
            contractDate: params.getParam(
              'contractDate',
              ParamType.DateTime,
            ),
            isDriver: params.getParam(
              'isDriver',
              ParamType.bool,
            ),
            role: params.getParam(
              'role',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Roles'],
            ),
            educationData: params.getParam(
              'educationData',
              ParamType.String,
            ),
            isEmployed: params.getParam(
              'isEmployed',
              ParamType.String,
            ),
            relegion: params.getParam(
              'relegion',
              ParamType.String,
            ),
            jobCode: params.getParam(
              'jobCode',
              ParamType.String,
            ),
            sectorID: params.getParam(
              'sectorID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'supervisor_home',
          path: '/supervisorHome',
          requireAuth: true,
          builder: (context, params) => const SupervisorHomeWidget(),
        ),
        FFRoute(
          name: 'Admin_Home',
          path: '/adminHome',
          requireAuth: true,
          builder: (context, params) => const AdminHomeWidget(),
        ),
        FFRoute(
          name: 'my_profile',
          path: '/my_profile',
          requireAuth: true,
          builder: (context, params) => const MyProfileWidget(),
        ),
        FFRoute(
          name: 'worker_Home',
          path: '/workerHome',
          requireAuth: true,
          builder: (context, params) => const WorkerHomeWidget(),
        ),
        FFRoute(
          name: 'transmission_Select_1',
          path: '/transmission_Select_1',
          requireAuth: true,
          builder: (context, params) => const TransmissionSelect1Widget(),
        ),
        FFRoute(
          name: 'transmission_Scan_2',
          path: '/transmission_Scan_2',
          requireAuth: true,
          builder: (context, params) => const TransmissionScan2Widget(),
        ),
        FFRoute(
          name: 'HowToUseApp',
          path: '/howToUseApp',
          builder: (context, params) => const HowToUseAppWidget(),
        ),
        FFRoute(
          name: 'checkup',
          path: '/checkup',
          requireAuth: true,
          builder: (context, params) => const CheckupWidget(),
        ),
        FFRoute(
          name: 'supplierDashboard',
          path: '/supplierDashboard',
          requireAuth: true,
          builder: (context, params) => const SupplierDashboardWidget(),
        ),
        FFRoute(
          name: 'applyforjob',
          path: '/applyforjob',
          builder: (context, params) => const ApplyforjobWidget(),
        ),
        FFRoute(
          name: 'Onboarding04',
          path: '/onboarding04',
          builder: (context, params) => const Onboarding04Widget(),
        ),
        FFRoute(
          name: 'hintBeforeapplyjob',
          path: '/hintBeforeapplyjob',
          builder: (context, params) => const HintBeforeapplyjobWidget(),
        ),
        FFRoute(
          name: 'Home13Productivity',
          path: '/home13Productivity',
          builder: (context, params) => const Home13ProductivityWidget(),
        ),
        FFRoute(
          name: 'tasksTracker',
          path: '/tasksTracker',
          builder: (context, params) => const TasksTrackerWidget(),
        ),
        FFRoute(
          name: 'complain_formCopy',
          path: '/complainFormCopy',
          requireAuth: true,
          asyncParams: {
            'supervisorDoc': getDoc(['users'], UsersRecord.fromSnapshot),
            'requestDec':
                getDoc(['Tools_Requests'], ToolsRequestsRecord.fromSnapshot),
          },
          builder: (context, params) => ComplainFormCopyWidget(
            supervisorDoc: params.getParam(
              'supervisorDoc',
              ParamType.Document,
            ),
            requestDec: params.getParam(
              'requestDec',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'usersList',
          path: '/usersList',
          builder: (context, params) => const UsersListWidget(),
        ),
        FFRoute(
          name: 'list',
          path: '/list',
          builder: (context, params) => const ListWidget(),
        ),
        FFRoute(
          name: 'Settings1Notifications',
          path: '/settings1Notifications',
          builder: (context, params) => const Settings1NotificationsWidget(),
        ),
        FFRoute(
          name: 'Sv_Work_Requests',
          path: '/requestss',
          builder: (context, params) => const SvWorkRequestsWidget(),
        ),
        FFRoute(
          name: 'Attendanceofworkers',
          path: '/attendanceofworkers',
          builder: (context, params) => const AttendanceofworkersWidget(),
        ),
        FFRoute(
          name: 'Sv_map',
          path: '/svMap',
          builder: (context, params) => SvMapWidget(
            leaderRef: params.getParam(
              'leaderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Leaders'],
            ),
          ),
        ),
        FFRoute(
          name: 'AttendenceofSupervisor',
          path: '/attendenceofSupervisor',
          builder: (context, params) => const AttendenceofSupervisorWidget(),
        ),
        FFRoute(
          name: 'loggingout_for_supervisor',
          path: '/loggingoutForSupervisor',
          builder: (context, params) => const LoggingoutForSupervisorWidget(),
        ),
        FFRoute(
          name: 'Submitting_complaints',
          path: '/submittingComplaints',
          builder: (context, params) => SubmittingComplaintsWidget(
            userReported: params.getParam(
              'userReported',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'DailyReport',
          path: '/dailyReport',
          builder: (context, params) => const DailyReportWidget(),
        ),
        FFRoute(
          name: 'Taskdetails',
          path: '/taskdetails',
          asyncParams: {
            'taskDetails': getDoc(['Streets'], StreetsRecord.fromSnapshot),
          },
          builder: (context, params) => TaskdetailsWidget(
            taskDetails: params.getParam(
              'taskDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'loggingout_for_Workers',
          path: '/loggingoutForWorkers',
          builder: (context, params) => const LoggingoutForWorkersWidget(),
        ),
        FFRoute(
          name: 'workers_review',
          path: '/workersReview',
          builder: (context, params) => WorkersReviewWidget(
            userReviewed: params.getParam(
              'userReviewed',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'DetailsArea',
          path: '/detailsArea',
          builder: (context, params) => const DetailsAreaWidget(),
        ),
        FFRoute(
          name: 'Tm_Home',
          path: '/tmHome',
          requireAuth: true,
          builder: (context, params) => const TmHomeWidget(),
        ),
        FFRoute(
          name: 'Add_Movement',
          path: '/addMovement',
          builder: (context, params) => const AddMovementWidget(),
        ),
        FFRoute(
          name: 'Add_servicingreport',
          path: '/addServicingreport',
          builder: (context, params) => const AddServicingreportWidget(),
        ),
        FFRoute(
          name: 'Tm_List_Requests',
          path: '/tmListRequests',
          builder: (context, params) => const TmListRequestsWidget(),
        ),
        FFRoute(
          name: 'Tm_Task_Discription',
          path: '/tmTaskDiscription',
          builder: (context, params) => TmTaskDiscriptionWidget(
            vehicle: params.getParam(
              'vehicle',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['VehicleRequest'],
            ),
          ),
        ),
        FFRoute(
          name: 'ServicingDiscription',
          path: '/servicingDiscription',
          builder: (context, params) => const ServicingDiscriptionWidget(),
        ),
        FFRoute(
          name: 'Tm_List_Fixing',
          path: '/tmListFixing',
          builder: (context, params) => const TmListFixingWidget(),
        ),
        FFRoute(
          name: 'Form_for_LatedTask',
          path: '/formForLatedTask',
          builder: (context, params) => const FormForLatedTaskWidget(),
        ),
        FFRoute(
          name: 'TaskdetailsCopy',
          path: '/taskdetailsCopy',
          builder: (context, params) => const TaskdetailsCopyWidget(),
        ),
        FFRoute(
          name: 'Sv_RequestsCopy',
          path: '/sv_requestss',
          builder: (context, params) => const SvRequestsCopyWidget(),
        ),
        FFRoute(
          name: 'supllierHome',
          path: '/supllierHome',
          requireAuth: true,
          builder: (context, params) => const SupllierHomeWidget(),
        ),
        FFRoute(
          name: 'send_personal_request',
          path: '/sendPersonalRequest',
          builder: (context, params) => const SendPersonalRequestWidget(),
        ),
        FFRoute(
          name: 'workersattendance',
          path: '/workersattendance',
          requireAuth: true,
          builder: (context, params) => const WorkersattendanceWidget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'Home19PropertyAppbookingapp',
          path: '/home19PropertyAppbookingapp',
          builder: (context, params) => const Home19PropertyAppbookingappWidget(),
        ),
        FFRoute(
          name: 'rr',
          path: '/rr',
          builder: (context, params) => const RrWidget(),
        ),
        FFRoute(
          name: 'List_complaints',
          path: '/listComplaints',
          builder: (context, params) => const ListComplaintsWidget(),
        ),
        FFRoute(
          name: 'OM_Home',
          path: '/oMHome',
          requireAuth: true,
          builder: (context, params) => const OMHomeWidget(),
        ),
        FFRoute(
          name: 'Details03TransactionsSummary',
          path: '/details03TransactionsSummary',
          builder: (context, params) => const Details03TransactionsSummaryWidget(),
        ),
        FFRoute(
          name: 'OM_complandiscription',
          path: '/oMComplandiscription',
          builder: (context, params) => OMComplandiscriptionWidget(
            reportDetails: params.getParam(
              'reportDetails',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Complaints'],
            ),
          ),
        ),
        FFRoute(
          name: 'OM_List_work_orders',
          path: '/oMListWorkOrders',
          builder: (context, params) => const OMListWorkOrdersWidget(),
        ),
        FFRoute(
          name: 'OM_work_Orders_discription',
          path: '/oMWorkOrdersDiscription',
          builder: (context, params) => OMWorkOrdersDiscriptionWidget(
            workerRequest: params.getParam(
              'workerRequest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['WorkerRequest'],
            ),
          ),
        ),
        FFRoute(
          name: 'List_Reviews',
          path: '/listReviews',
          builder: (context, params) => const ListReviewsWidget(),
        ),
        FFRoute(
          name: 'dash2',
          path: '/dash2',
          builder: (context, params) => const Dash2Widget(),
        ),
        FFRoute(
          name: 'List_maps',
          path: '/listMaps',
          builder: (context, params) => const ListMapsWidget(),
        ),
        FFRoute(
          name: 'Add_maps',
          path: '/addMaps',
          builder: (context, params) => const AddMapsWidget(),
        ),
        FFRoute(
          name: 'user_Profile',
          path: '/userProfile',
          builder: (context, params) => UserProfileWidget(
            userDoc: params.getParam(
              'userDoc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'updateUser',
          path: '/updateUser',
          requireAuth: true,
          builder: (context, params) => UpdateUserWidget(
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'Details20Property',
          path: '/details20Property',
          builder: (context, params) => const Details20PropertyWidget(),
        ),
        FFRoute(
          name: 'OM_List_All_Task',
          path: '/oMListAllTask',
          builder: (context, params) => const OMListAllTaskWidget(),
        ),
        FFRoute(
          name: 'OM_Supmited_taskDetalis',
          path: '/oMSupmitedTaskDetalis',
          builder: (context, params) => OMSupmitedTaskDetalisWidget(
            streetTaskDetail: params.getParam(
              'streetTaskDetail',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['streetTasks'],
            ),
          ),
        ),
        FFRoute(
          name: 'OM_List_All_DailyReports',
          path: '/oMListAllDailyReports',
          builder: (context, params) => const OMListAllDailyReportsWidget(),
        ),
        FFRoute(
          name: 'OM_View_DailyReport',
          path: '/oMViewDailyReport',
          builder: (context, params) => OMViewDailyReportWidget(
            reportRefrence: params.getParam(
              'reportRefrence',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Daily_Reports'],
            ),
          ),
        ),
        FFRoute(
          name: 'OM_List_Personal_orders',
          path: '/oMListPersonalOrders',
          builder: (context, params) => const OMListPersonalOrdersWidget(),
        ),
        FFRoute(
          name: 'OM_Personal_Orders_discription',
          path: '/oMPersonalOrdersDiscription',
          builder: (context, params) => OMPersonalOrdersDiscriptionWidget(
            personalOrder: params.getParam(
              'personalOrder',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PersonalRequests'],
            ),
          ),
        ),
        FFRoute(
          name: 'OM_View_Distribution_of_workers',
          path: '/oMViewDistributionOfWorkers',
          builder: (context, params) => OMViewDistributionOfWorkersWidget(
            leaderRef: params.getParam(
              'leaderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Leaders'],
            ),
          ),
        ),
        FFRoute(
          name: 'OM_List_Distribution_of_workers',
          path: '/oMListDistributionOfWorkers',
          builder: (context, params) => const OMListDistributionOfWorkersWidget(),
        ),
        FFRoute(
          name: 'New_Admin_Home',
          path: '/newAdminHome',
          requireAuth: true,
          builder: (context, params) => const NewAdminHomeWidget(),
        ),
        FFRoute(
          name: 'Home07Invoices',
          path: '/home07Invoices',
          builder: (context, params) => const Home07InvoicesWidget(),
        ),
        FFRoute(
          name: 'Manualattendance',
          path: '/manualattendance',
          requireAuth: true,
          builder: (context, params) => const ManualattendanceWidget(),
        ),
        FFRoute(
          name: 'Other_Home',
          path: '/otherHome',
          requireAuth: true,
          builder: (context, params) => const OtherHomeWidget(),
        ),
        FFRoute(
          name: 'viewLocation',
          path: '/viewLocation',
          builder: (context, params) => ViewLocationWidget(
            location: params.getParam(
              'location',
              ParamType.LatLng,
            ),
          ),
        ),
        FFRoute(
          name: 'set_street_supervisor',
          path: '/setStreetSupervisor',
          builder: (context, params) => const SetStreetSupervisorWidget(),
        ),
        FFRoute(
          name: 'other_services',
          path: '/otherServices',
          requireAuth: true,
          builder: (context, params) => const OtherServicesWidget(),
        ),
        FFRoute(
          name: 'suc',
          path: '/suc',
          builder: (context, params) => const SucWidget(),
        ),
        FFRoute(
          name: 'New_Tm_Home',
          path: '/newTmHome',
          requireAuth: true,
          builder: (context, params) => const NewTmHomeWidget(),
        ),
        FFRoute(
          name: 'ChooseWorkersManual',
          path: '/chooseWorkersManual',
          requireAuth: true,
          builder: (context, params) => ChooseWorkersManualWidget(
            leaderArea: params.getParam(
              'leaderArea',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Leaders'],
            ),
          ),
        ),
        FFRoute(
          name: 'AccountantHome',
          path: '/accountantHome',
          requireAuth: true,
          builder: (context, params) => const AccountantHomeWidget(),
        ),
        FFRoute(
          name: 'Supplier_Transactions',
          path: '/supplierTransactions',
          builder: (context, params) => SupplierTransactionsWidget(
            contRef: params.getParam(
              'contRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['contractors'],
            ),
          ),
        ),
        FFRoute(
          name: 'Add_Transactions',
          path: '/addTransactions',
          builder: (context, params) => AddTransactionsWidget(
            contRef: params.getParam(
              'contRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['contractors'],
            ),
          ),
        ),
        FFRoute(
          name: 'contractorsList',
          path: '/contractorsList',
          builder: (context, params) => const ContractorsListWidget(),
        ),
        FFRoute(
          name: 'OM_Cars_Orders_discription',
          path: '/oMCarsOrdersDiscription',
          builder: (context, params) => OMCarsOrdersDiscriptionWidget(
            vehicleRequest: params.getParam(
              'vehicleRequest',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['VehicleRequest'],
            ),
          ),
        ),
        FFRoute(
          name: 'Create04TaskCopy',
          path: '/create04TaskCopy',
          builder: (context, params) => const Create04TaskCopyWidget(),
        ),
        FFRoute(
          name: 'Eng_Home',
          path: '/engHome',
          requireAuth: true,
          builder: (context, params) => const EngHomeWidget(),
        ),
        FFRoute(
          name: 'Eng_list_technicalsupport',
          path: '/engListTechnicalsupport',
          builder: (context, params) => const EngListTechnicalsupportWidget(),
        ),
        FFRoute(
          name: 'Eng_technicalsupport_details',
          path: '/engTechnicalsupportDetails',
          builder: (context, params) => EngTechnicalsupportDetailsWidget(
            bugReport: params.getParam(
              'bugReport',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bugReports'],
            ),
          ),
        ),
        FFRoute(
          name: 'Send_technicalsupport',
          path: '/sendTechnicalsupport',
          builder: (context, params) => const SendTechnicalsupportWidget(),
        ),
        FFRoute(
          name: 'Tm_List_Movment',
          path: '/tmListMovment',
          builder: (context, params) => const TmListMovmentWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? const Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitDualRing(
                      color: Color(0xFF0CA256),
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
