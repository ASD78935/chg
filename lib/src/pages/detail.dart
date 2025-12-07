import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatefulWidget {
  final Map<String, String> data; // 홈에서 데이터를 받아옴
  const Detail({super.key, required this.data});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent, // 투명하게
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back(); // 뒤로가기
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.white)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white)),
      ],
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상품 이미지 (Hero 애니메이션 적용)
          Stack(
            children: [
              Hero(
                tag: widget.data["image"]!, // 홈 화면과 똑같은 태그를 줘야 연결됨
                child: Image.network(
                  widget.data["image"]!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 300, color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.image_not_supported, size: 50)),
                    );
                  },
                ),
              ),
               Positioned(
                 top: 0, left: 0, right: 0,
                 child: _appbarWidget() // 이미지 위에 앱바 겹치기
               ),
            ],
          ),
          
          // 판매자 프로필 영역
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"), 
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("개발하는남자", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("잠실동", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text("37.5℃", style: TextStyle(color: Color(0xff00c73c), fontWeight: FontWeight.bold)),
                    Text("매너온도", style: TextStyle(decoration: TextDecoration.underline, fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
          const Divider(height: 1),

          // 상품 내용 영역
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data["title"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                const Text("기타 정보", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 10),
                const Text(
                  "구매한지 얼마 안된 제품입니다. \n테스트용으로 올려봅니다. \n직거래 선호해요!",
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 55,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
          Container(width: 1, height: 40, color: Colors.grey.withOpacity(0.3)),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data["price"]! + "원", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const Text("가격제안불가", style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffff8a3d)),
            child: const Text("채팅으로 거래하기", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 앱바 뒤로 바디영역 확장
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}