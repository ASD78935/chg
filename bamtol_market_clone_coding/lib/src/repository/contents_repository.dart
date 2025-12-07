import 'package:flutter/material.dart';

class ContentsRepository {
  // 가짜 데이터 (서버에서 받아왔다고 가정)
  // 원래는 Firebase에서 가져와야 하지만, 5일 완성 전략을 위해 여기서 직접 만듭니다.
  Map<String, dynamic> data = {
    "jamsil": [
      {
        "image": "https://placehold.co/100", // 임시 이미지 URL
        "title": "빈티지 롤러 스케이트",
        "location": "잠실동",
        "price": "30000",
        "likes": "2",
      },
      {
        "image": "https://placehold.co/100",
        "title": "아이폰 13 프로 팝니다",
        "location": "잠실동",
        "price": "850000",
        "likes": "13",
      },
      {
        "image": "https://placehold.co/100",
        "title": "다이슨 드라이기",
        "location": "송파동",
        "price": "200000",
        "likes": "5",
      },
       {
        "image": "https://placehold.co/100",
        "title": "어린이 자전거",
        "location": "방이동",
        "price": "15000",
        "likes": "8",
      },
    ]
  };

  // 데이터를 불러오는 함수 (Future를 써서 비동기 처리 흉내)
  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    // 1초 정도 로딩 걸리는 척 (UX를 위해)
    await Future.delayed(const Duration(milliseconds: 1000));
    return data[location];
  }
}