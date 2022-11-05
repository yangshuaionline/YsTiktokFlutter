import 'package:flutter/material.dart';
///我
class MineHomeWidget extends StatefulWidget {
  const MineHomeWidget({super.key});
  @override
  State<MineHomeWidget> createState() => _MineHomeWidgetState();
}

class _MineHomeWidgetState extends State<MineHomeWidget> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String title = "我的";
  @override
  void initState(){
    super.initState();
  }
  /// 生命周期函数，组件销毁时调用
  @override
  void dispose() {
    super.dispose();
  }

  @override
  CustomScrollView build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(), //ios风格的上拉出来空白
//        physics: ClampingScrollPhysics(),
      reverse: false,
      slivers: <Widget>[
        SliverAppBar(
          title: const Text("scrollview"),
          centerTitle: true,
          leading: const Icon(Icons.backspace),
          expandedHeight: 150,
          //AppBar是否固定在顶部
          pinned: true,
          floating: false,
          backgroundColor: Colors.cyanAccent,//SliverAppBar背景色
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(50, 0, 0, 17),
            centerTitle: false,
            title: const Text('flexibleSpace'),
            background: Image.network(
              "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  height: 300,
                  color: Colors.red,
                  child: const Text("第1行"),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  child: const Text("第2行"),
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                  child: const Text("第3行"),
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                  child: const Text("第4行"),
                ),
              ])),
        ),],);
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Column(
          //     children: <Widget>[
          //       Text(
          //         title,
          //       ),
          //       Text(
          //         '$_counter',
          //         style: Theme.of(context).textTheme.headline4,
          //       ),
          //       Container(
          //         width: 120,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 150,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 180,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 120,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 150,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 180,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 120,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 150,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 180,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 120,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 150,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 180,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 120,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 150,
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 180,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //     ],
          //   ),
          // )
    //     ]
    // );
  }
}