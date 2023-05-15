import 'package:flutter/material.dart';
import 'package:safemap/safemap.dart';
import 'package:tapped/tapped.dart';
import 'package:video_player/video_player.dart';
import 'package:ys_tiktok_flutter/page/searchPage.dart';
import 'package:ys_tiktok_flutter/page/tikTokPage.dart';
import 'package:ys_tiktok_flutter/page/userPage.dart';

import '../controller/tikTokVideoListController.dart';
import '../entity/video.dart';
import '../style/physics.dart';
import '../widget/homeTabBar.dart';
import '../widget/tikTokCommentBottomSheet.dart';
import '../widget/tikTokHeader.dart';
import '../widget/tikTokVideo.dart';
import '../widget/tikTokVideoButtonColumn.dart';
import 'cameraPage.dart';
import 'firstPage.dart';
import 'followPage.dart';
/// 单独修改了bottomSheet组件的高度
import '../other/bottomSheet.dart' as CustomBottomSheet;
///Home页面
///页面包括底部四个button和页面整体得交互
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  /// tab标签
  HomePageTag tabBarType = HomePageTag.home;

  TikTokScaffoldController tkController = TikTokScaffoldController();

  PageController _pageController = PageController();

  TikTokVideoListController _videoListController = TikTokVideoListController();

  /// 记录点赞
  Map<int, bool> favoriteMap = {};

  List<UserVideo> videoDataList = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state != AppLifecycleState.resumed) {
      _videoListController.currentPlayer.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoListController.currentPlayer.pause();
    super.dispose();
  }

  @override
  void initState() {
    videoDataList = UserVideo.fetchVideo();
    WidgetsBinding.instance.addObserver(this);
    _videoListController.init(
      pageController: _pageController,
      initialList: videoDataList
          .map(
            (e) => VPVideoController(
          videoInfo: e,
          builder: () => VideoPlayerController.network(e.url),
        ),
      )
          .toList(),
      videoProvider: (int index, List<VPVideoController> list) async {
        return videoDataList
            .map(
              (e) => VPVideoController(
            videoInfo: e,
            builder: () => VideoPlayerController.network(e.url),
          ),
        )
            .toList();
      },
    );
    _videoListController.addListener(() {
      setState(() {});
    });
    tkController.addListener(
          () {
        if (tkController.value == TikTokPagePositon.middle) {
          _videoListController.currentPlayer.play();
        } else {
          _videoListController.currentPlayer.pause();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;

    switch (tabBarType) {
      case HomePageTag.home:
        currentPage = FirstPage();
        break;
      case HomePageTag.find:
        currentPage = FollowPage();
        break;
      case HomePageTag.goods:
        currentPage = FollowPage();
        break;
      case HomePageTag.mine:
        currentPage = FollowPage();
        break;
    }
    double a = MediaQuery.of(context).size.aspectRatio;
    bool hasBottomPadding = a < 0.55;

    bool hasBackground = hasBottomPadding;
    hasBackground = tabBarType != HomePageTag.home;
    if (hasBottomPadding) {
      hasBackground = true;
    }
    Widget homeTabBar = HomeTabBar(
      hasBackground: hasBackground,
      current: tabBarType,
      onTabSwitch: (type) async {
        setState(() {
          tabBarType = type;
          if (type == HomePageTag.home) {
            _videoListController.currentPlayer.play();
          } else {
            _videoListController.currentPlayer.pause();
          }
        });
      },
      onAddButton: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CameraPage(),
          ),
        );
      },
    );

    var userPage = UserPage(
      isSelfPage: false,
      canPop: true,
      onPop: () {
        tkController.animateToMiddle();
      },
    );
    var searchPage = SearchPage(
      onPop: tkController.animateToMiddle,
    );

    // var header = tabBarType == HomePageTag.home
    //     ? TikTokHeader(
    //   onSearch: () {
    //     tkController.animateToLeft();
    //   },
    // ) : Container();
    // var header = Tapped(
    //   child: Container(
    //     color: Colors.black.withOpacity(0),
    //     padding: const EdgeInsets.all(4),
    //     alignment: Alignment.topLeft,
    //     child: Icon(
    //       Icons.arrow_back_ios,
    //       color: Colors.white.withOpacity(0.66),
    //     ),
    //   ),
    //   onTap: (){ Navigator.of(context).pop();},
    // );

    // 组合
    return TikTokScaffold(
      controller: tkController,
      hasBottomPadding: hasBackground,
      tabBar: homeTabBar,
      // header: header,//title不走组合，不设置
      leftPage: searchPage,
      rightPage: userPage,
      enableGesture: tabBarType == HomePageTag.home,
      // onPullDownRefresh: _fetchData,
      page: Stack(
        // index: currentPage == null ? 0 : 1,
        children: <Widget>[
          PageView.builder(
            key: const Key('home'),
            physics: const QuickerScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _videoListController.videoCount,
            itemBuilder: (context, i) {
              // 拼一个视频组件出来
              bool isF = SafeMap(favoriteMap)[i].boolean;
              var player = _videoListController.playerOfIndex(i)!;
              var data = player.videoInfo!;
              // 右侧按钮列
              Widget buttons = TikTokButtonColumn(
                isFavorite: isF,
                onAvatar: () {
                  tkController.animateToPage(TikTokPagePositon.right);
                },
                onFavorite: () {
                  setState(() {
                    favoriteMap[i] = !isF;
                  });
                  // showAboutDialog(context: context);
                },
                onComment: () {
                  CustomBottomSheet.showModalBottomSheet(
                    backgroundColor: Colors.white.withOpacity(0),
                    context: context,
                    builder: (BuildContext context) =>
                    const TikTokCommentBottomSheet(),
                  );
                },
                onShare: () {},
              );
              // video
              Widget currentVideo = Center(
                child: AspectRatio(
                  aspectRatio: player.controller.value.aspectRatio,
                  child: VideoPlayer(player.controller),
                ),
              );

              currentVideo = TikTokVideoPage(
                // 手势播放与自然播放都会产生暂停按钮状态变化，待处理
                hidePauseIcon: !player.showPauseIcon.value,
                aspectRatio: 9 / 16.0,
                key: Key('${data.url}$i'),
                tag: data.url,
                bottomPadding: hasBottomPadding ? 16.0 : 16.0,
                userInfoWidget: VideoUserInfo(
                  desc: data.desc,
                  bottomPadding: hasBottomPadding ? 16.0 : 50.0,
                ),
                onSingleTap: () async {
                  if (player.controller.value.isPlaying) {
                    await player.pause();
                  } else {
                    await player.play();
                  }
                  setState(() {});
                },
                onAddFavorite: () {
                  setState(() {
                    favoriteMap[i] = true;
                  });
                },
                rightButtonColumn: buttons,
                video: currentVideo,
              );
              return currentVideo;
            },
          ),
          currentPage ?? Container(),
        ],
      ),
    );
    // Stack(
    //   children: [
    //
    //     // Expanded(
    //     //   child: Tapped(
    //     //     child: Container(
    //     //       color: Colors.black.withOpacity(0),
    //     //       padding: const EdgeInsets.all(4),
    //     //       alignment: Alignment.topLeft,
    //     //       child: Icon(
    //     //         Icons.arrow_back_ios,
    //     //         color: Colors.white.withOpacity(0.66),
    //     //       ),
    //     //     ),
    //     //     onTap: (){ Navigator.of(context).pop();},
    //     //   ),
    //     // )
    //   ],
    // );
  }
}
