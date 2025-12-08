import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bamtol_market_app/src/repository/contents_repository.dart';
import 'package:bamtol_market_app/src/pages/detail.dart';
import 'package:bamtol_market_app/src/pages/write.dart'; // [중요] 글쓰기 페이지 import
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ContentsRepository contentsRepository;
  String currentLocation = "jamsil"; 

  final oCcy = NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  @override
  void initState() {
    super.initState();
    contentsRepository = ContentsRepository();
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("동네 변경 클릭");
        },
        child: Row(
          children: const [
            Text("잠실동"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
      ],
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: contentsRepository.loadContentsFromLocation(currentLocation),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("데이터 오류"));
        }
        if (snapshot.hasData) {
          var datas = snapshot.data as List<Map<String, String>>;
          
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => Detail(data: datas[index]));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Hero(
                          tag: datas[index]["image"]!,
                          child: Image.network(
                            datas[index]["image"]!,
                            width: 100, height: 100, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                               return Container(width: 100, height: 100, color: Colors.grey[300], child: const Icon(Icons.image_not_supported));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(datas[index]["title"]!, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15)),
                              const SizedBox(height: 5),
                              Text(datas[index]["location"]!, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3))),
                              const SizedBox(height: 5),
                              Text(calcStringToWon(datas[index]["price"]!), style: const TextStyle(fontWeight: FontWeight.w500)),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.favorite_border, size: 15, color: Colors.grey,),
                                    const SizedBox(width: 4),
                                    Text(datas[index]["likes"]!),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 1, color: Colors.black.withOpacity(0.1));
            },
            itemCount: datas.length,
          );
        }
        return const Center(child: Text("데이터 없음"));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      // [12장 핵심] 글쓰기 버튼 추가
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const Write()); // Write 페이지로 이동
        },
        backgroundColor: const Color(0xffff8a3d), // 당근 색깔
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}