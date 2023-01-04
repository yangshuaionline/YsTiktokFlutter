
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            children: <Widget>[
              const Icon(Icons.sports_handball_sharp),
              Padding(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0, ScreenUtil().setWidth(10), 0),
                child: const Icon(Icons.search),
              ),
              const Icon(Icons.menu)
            ],
          ),
          centerTitle: true,
          // leading: const Icon(Icons.backspace),
          expandedHeight: ScreenUtil().setWidth(200),
          collapsedHeight: ScreenUtil().setWidth(200),
          pinned: false,//AppBar是否固定在顶部
          floating: false,
          backgroundColor: Colors.cyanAccent,//SliverAppBar背景色
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), ScreenUtil().setWidth(100), ScreenUtil().setWidth(100), ScreenUtil().setWidth(20)),
            centerTitle: false,
            title: Row(
              children:  <Widget>[
                Center(
                  child: Container(
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(100)),
                      image: const DecorationImage(
                        image: AssetImage("assets/mipmap/icon_headpic.webp"),
                      ),
                    ),
                  ),
                ),
                Expanded(//头像右边文字
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0, 0, 0),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("游戏熊猫",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w300,
                              ),),
                            SizedBox(
                              height: ScreenUtil().setSp(18),
                              width: ScreenUtil().setSp(18),
                              child: IconButton(
                                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5),0,0,0),
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.white,
                                  size: ScreenUtil().setWidth(18),
                                ),
                                onPressed: () {  },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:  <Widget>[
                            Text("抖音号：gamepanda",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(13),
                                fontWeight: FontWeight.w300,
                              ),),
                             SizedBox(
                               height: ScreenUtil().setWidth(12),
                               width: ScreenUtil().setWidth(12),
                               child: IconButton(
                                 padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5),0,0,0),
                                 icon: Icon(Icons.qr_code,color: Colors.white,size: ScreenUtil().setSp(12),),
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
                  padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "7.0万",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(15)
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(5),right: ScreenUtil().setWidth(15)),
                        child: Text(
                          "获赞",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(15)
                          ),),
                      ),
                      Text(
                        "25",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(5) ,right: ScreenUtil().setWidth(15) ),
                        child: Text(
                          "关注",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setWidth(15)
                          ),),
                      ),
                      Text(
                        "1.5万",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)
                        ),),
                      Padding(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(5) ,right: ScreenUtil().setWidth(15)),
                        child: Text(
                          "粉丝",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(15)
                          ),),
                      ),
                    ],
                  ),
                ),
                //个人签名
                Container(
                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(15) ,right: ScreenUtil().setWidth(15),top: ScreenUtil().setWidth(5),bottom: ScreenUtil().setWidth(5)),
                  color: Colors.black,
                  child: Text(
                      "该用户关注了你\n推荐、分享好玩的小游戏！",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(15)
                    ),
                  ),
                ),
                //个人标签
                Container(
                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(10),right: ScreenUtil().setWidth(10),top: ScreenUtil().setWidth(0),bottom: ScreenUtil().setWidth(5)),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                        child: Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: ScreenUtil().setWidth(12),),
                          ),
                          label: Text('北京-昌平',style: TextStyle(fontSize: ScreenUtil().setSp(11)),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                        child: Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: ScreenUtil().setWidth(12),),
                          ),
                          label: Text('北京理工大学',style: TextStyle(fontSize: ScreenUtil().setSp(11)),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                        child: Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.sports_handball_sharp,color: Colors.white,size: ScreenUtil().setSp(12),),
                          ),
                          label: Text('添加性别等标签',style: TextStyle(fontSize: ScreenUtil().setWidth(11)),),
                        ),
                      ),
                    ],
                  ),
                ),
                //粉丝群  抖音商城
                Container(
                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(15),right: ScreenUtil().setWidth(15),top: ScreenUtil().setWidth(10),bottom: ScreenUtil().setWidth(10)),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setWidth(50),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
                              image: const DecorationImage(
                                image: AssetImage("assets/mipmap/icon_headpic.webp"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10),right: ScreenUtil().setWidth(45)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                                  child: Text(
                                    "粉丝群",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15)
                                    ),
                                  ),
                                ),
                                Text(
                                  "1个群聊",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(10)
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
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setWidth(50),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3)),
                              image: const DecorationImage(
                                image: AssetImage("assets/mipmap/icon_headpic.webp"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10),right: ScreenUtil().setWidth(30)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                                  child: Text(
                                    "抖音商城",
                                    textAlign:TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                    ),
                                  ),
                                ),
                                Text(
                                  "美好生活触手可得",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(10)
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
                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(15),right: ScreenUtil().setWidth(15),top: ScreenUtil().setWidth(10),bottom: ScreenUtil().setWidth(5)),
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                        child: SizedBox(
                          child: CupertinoButton(
                            color: Colors.grey,
                            onPressed: () {  },
                            child: Text('编辑资料',style: TextStyle(fontSize: ScreenUtil().setSp(10),color: Colors.white),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                        child: SizedBox(
                          child: CupertinoButton(
                            color: Colors.grey,
                            onPressed: () {  },
                            child: Text('添加朋友',style: TextStyle(fontSize: ScreenUtil().setSp(10),color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //tab
                Container(
                  height: ScreenUtil().setWidth(500),
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
                                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                                crossAxisSpacing: ScreenUtil().setWidth(10),
                                mainAxisSpacing: ScreenUtil().setWidth(10),
                                crossAxisCount: 3,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                                    width: ScreenUtil().setWidth(200),
                                    height: ScreenUtil().setWidth(60),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/mipmap/icon_headpic.webp"),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '2000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
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