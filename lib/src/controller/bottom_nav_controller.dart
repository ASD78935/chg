import 'package:get/get.dart';

enum RouteName {
  HOME,
  LIFE,
  NEAR,
  CHAT,
  MYPAGE,
}

class BottomNavController extends GetxController {
  // 현재 몇 번째 탭인지 관리하는 변수 (0번: 홈)
  RxInt pageIndex = 0.obs;

  // 탭을 바꿀 때 실행되는 함수
  void changeBottomNav(int value) {
    // 0: 홈, 1: 동네생활, 2: 내 근처, 3: 채팅, 4: 나의 당근
    var page = RouteName.values[value];
    
    switch (page) {
      case RouteName.HOME:
      case RouteName.LIFE:
      case RouteName.NEAR:
      case RouteName.CHAT:
      case RouteName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}