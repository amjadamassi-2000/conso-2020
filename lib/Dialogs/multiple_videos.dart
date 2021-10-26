import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';



class ShowVideos extends StatefulWidget {
  static final GlobalKey<_ShowVideosState> staticGlobalKey = new GlobalKey<_ShowVideosState>();


  ShowVideos() :super(key:staticGlobalKey );

  @override
  _ShowVideosState createState() => _ShowVideosState();
}

class _ShowVideosState extends State<ShowVideos> {
  // VideoPlayerController _controller;

  PageController pageController;


  List ads = [] ;
  createVideoPlayerController(){

  }
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.9999,);

    for(int i =0 ; i<10 ; i++){
      ads.add('http://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4') ;
      ads.add('http://techslides.com/demos/sample-videos/small.mp4') ;

    }
    // pageController.jumpToPage(widget.index);

    super.initState();
    // _controller.addListener(() {
    //   if (_controller.value.position == _controller.value.duration) {
    //     setState(() {
    //       isPlaying = false;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(
        itemCount: ads.length,
        controller: pageController,
        physics: AlwaysScrollableScrollPhysics(),
        onPageChanged: (value) {
          print('onPageChanged $value');

        },

        itemBuilder: (context, index) {
          print('itemBuilder');

          return Video(ads[index], index);
        },
      ),
    );
  }
}

class Video extends StatefulWidget {

  String url ;
  int position ;
  Video(this.url,this.position);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  PageController pageController;
  VideoPlayerController playerController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     playerController = VideoPlayerController.network(widget.url) ;

     playerController.initialize().then((_) {

       if(widget.position == 0){
         playerController.play();
         setState(() {});
       }
    });


    pageController = ShowVideos.staticGlobalKey.currentState.pageController ;
    pageController.addListener(() {
      if(pageController.page.toInt() == widget.position){

        playerController.play();
        setState(() {});


      }else{
        playerController.pause();
      }

    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    playerController.pause();
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       VideoPlayer(playerController)

      ],
    );
  }
}

