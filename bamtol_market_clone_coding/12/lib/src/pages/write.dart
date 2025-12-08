import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _detailController = TextEditingController();

  // 앱바 (완료 버튼 포함)
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.close), // 뒤로가기 대신 X 버튼
      ),
      title: const Text("중고거래 글쓰기", style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () {
            // [나중에] 여기에 파이어베이스 저장 로직이 들어감
            // 지금은 단순히 "등록 완료" 메시지 띄우고 뒤로 가기
            Get.snackbar("등록 완료", "상품이 등록되었습니다!");
            Get.back();
          },
          child: const Text(
            "완료",
            style: TextStyle(
              color: Color(0xffff8a3d), // 당근 색상
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  // 입력 폼들
  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 1. 사진 올리는 버튼 (모양만 구현)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera_alt, color: Colors.grey),
                    Text("0/10", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // 2. 제목 입력
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "글 제목",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffff8a3d))),
              ),
            ),
            const SizedBox(height: 15),

            // 3. 가격 입력
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number, // 숫자 키보드
              decoration: const InputDecoration(
                hintText: "가격 (원)",
                prefixText: "₩ ",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffff8a3d))),
              ),
            ),
             const SizedBox(height: 15),

            // 4. 내용 입력
            TextFormField(
              controller: _detailController,
              maxLines: 10, // 여러 줄 입력 가능
              decoration: const InputDecoration(
                hintText: "게시글 내용을 작성해주세요.",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffff8a3d))),
                border: InputBorder.none, // 테두리 없애기 (깔끔하게)
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}