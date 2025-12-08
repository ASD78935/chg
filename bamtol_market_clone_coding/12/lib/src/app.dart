import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/bottom_nav_controller.dart';
import 'package:bamtol_market_app/src/pages/home.dart'; // [핵심] 홈 화면 파일 불러오기

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 앱 실행 시 컨트롤러 등록
    Get.put(BottomNavController());

    return Scaffold(
      // [핵심] 탭 번호에 따라 화면이 바뀜
      body: Obx(() {
        switch (RouteName.values[controller.pageIndex.value]) {
          case RouteName.HOME:
            return const Home(); // [수정됨] 이제 홈 화면(리스트)이 나옵니다!
          case RouteName.LIFE:
            return const Center(child: Text('동네생활 화면'));
          case RouteName.NEAR:
            return const Center(child: Text('내 근처 화면'));
          case RouteName.CHAT:
            return const Center(child: Text('채팅 화면'));
          case RouteName.MYPAGE:
            return const Center(child: Text('나의 당근 화면'));
          default:
            return Container();
        }
      }),
      // 하단 탭 메뉴
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.pageIndex.value,
          onTap: controller.changeBottomNav,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.6),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: '동네생활',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: '내 근처',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '나의 당근',
            ),
          ],
        ),
      ),
    );
  }
}