
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///我
class MineHomeWidget extends StatefulWidget {
  const MineHomeWidget({super.key});
  @override
  State<MineHomeWidget> createState() => _MineHomeWidgetState();
}

class _MineHomeWidgetState extends State<MineHomeWidget> with SingleTickerProviderStateMixin{
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
       // physics: ClampingScrollPhysics(),
      reverse: false,
      slivers: <Widget>[
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Icon(Icons.sports_handball_sharp),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Icon(Icons.search),
              ),
              Icon(Icons.menu)
            ],
          ),
          centerTitle: true,
          // leading: const Icon(Icons.backspace),
          expandedHeight: 200,
          collapsedHeight: 200,
          pinned: false,//AppBar是否固定在顶部
          floating: false,
          backgroundColor: Colors.cyanAccent,//SliverAppBar背景色
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(15, 100, 100, 20),
            centerTitle: false,
            title: Row(
              children:  <Widget>[
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage("assets/mipmap/icon_headpic.webp"),
                      ),
                    ),
                  ),
                ),
                Expanded(//头像右边文字
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text("游戏熊猫",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),),
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                onPressed: () {  },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:  <Widget>[
                             const Text("抖音号：gamepanda",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),),
                             SizedBox(
                               height: 12,
                               width: 12,
                               child: IconButton(
                                 padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                 icon: const Icon(Icons.qr_code,color: Colors.white,size: 12,),
                                 onPressed: () {  },
                               ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // const Icon(Icons.sentiment_very_satisfied),
              ],
            ),
                background:Image.asset("assets/mipmap/bg_mine.webp",fit: BoxFit.cover,),
            ),
          ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                //点赞 关注 粉丝
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.black,
                  child: Row(
                    children: const <Widget>[
                      Text(
                        "7.0万",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:5,right: 15),
                        child: Text(
                          "获赞",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                      ),
                      Text(
                        "25",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:5,right: 15),
                        child: Text(
                          "关注",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                      ),
                      Text(
                        "1.5万",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:5,right: 15),
                        child: Text(
                          "粉丝",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),),
                      ),
                    ],
                  ),
                ),
                //个人签名
                Container(
                  padding: const EdgeInsets.only(left:15,right: 15,top: 5,bottom: 5),
                  color: Colors.black,
                  child: const Text(
                      "该用户关注了你\n推荐、分享好玩的小游戏！",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                ),
                //个人标签
                Container(
                  padding: const EdgeInsets.only(left:15,right: 15,top: 0,bottom: 5),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: 12,),
                          ),
                          label: Text('北京-昌平',style: TextStyle(fontSize: 12),),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: 12,),
                          ),
                          label: Text('北京理工大学',style: TextStyle(fontSize: 12),),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: 12,),
                          ),
                          label: Text('添加性别等标签',style: TextStyle(fontSize: 12),),
                        ),
                      ),
                    ],
                  ),
                ),
                //粉丝群  抖音商城
                Container(
                  padding: const EdgeInsets.only(left:15,right: 15,top: 10,bottom: 10),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(3),
                              image: const DecorationImage(
                                image: AssetImage("assets/mipmap/icon_headpic.webp"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 50),
                            child: Column(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "粉丝群",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                                Text(
                                  "1个群聊",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(3),
                              image: const DecorationImage(
                                image: AssetImage("assets/mipmap/icon_headpic.webp"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 50),
                            child: Column(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "抖音商城",
                                    textAlign:TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                    ),
                                  ),
                                ),
                                Text(
                                  "美好生活触手可得",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //编辑资料  添加朋友
                Container(
                  padding: const EdgeInsets.only(left:15,right: 15,top: 10,bottom: 5),
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                          child: CupertinoButton(
                            color: Colors.grey,
                            onPressed: () {  },
                            child: const Text('编辑资料',style: TextStyle(fontSize: 14,color: Colors.white),),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          child: CupertinoButton(
                            color: Colors.grey,
                            onPressed: () {  },
                            child: const Text('添加朋友',style: TextStyle(fontSize: 14,color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //tab
                Container(
                  height: 500,
                  color: Colors.deepPurpleAccent,
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 4,
                    child: Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        toolbarHeight: 0,
                        bottom: const TabBar(
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.white,
                            indicatorColor: Colors.yellow,
                            tabs: <Widget>[
                              Tab(
                                text: "作品",
                              ),
                              Tab(
                                text: "私密",
                              ),
                              Tab(
                                text: "收藏",
                              ),
                              Tab(
                                text: "喜欢",
                              ),
                            ]
                        ),
                      ),
                      body: TabBarView(
                          children: <Widget>[
                            Center(
                              child: GridView.count(
                                primary: false,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 200,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const Center(
                              child: Text("1",style: TextStyle(color: Colors.white),),
                            ),
                            const Center(
                              child: Text("2",style: TextStyle(color: Colors.white),),
                            ),
                            const Center(
                              child: Text("3",style: TextStyle(color: Colors.white),),
                            ),
                          ]
                      ),
                    ),
                  )
                ),
              ])),
        ),],);
  }
}