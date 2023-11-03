import 'package:flutter/material.dart';
import 'package:youtubevideo/models/channelmode.dart';
import 'package:youtubevideo/models/video.models.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Channel _channel;
  bool _isLoading =false;

  @override
  void initState(){
super.initState();
_initChannel();

  }
  _initChannel() async{
    Channel channel =await APIServices.instance.fetchChannel(channelId:'UCqJODva8CJ_JTbi5ssC2L-g');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(title :Text('youtube Channel'),
    ),
    body: ListView.builder(
      itemCount: 1 + _channel.videos.length,
    itemBuilder: (BuildContext context ,int index){
      if(index == 0){
        return _buildProfileInfo();
      }
      Video video = _channel.videos[index -1];
      return _buildVideo(video);
    },
    ),
    );
  }
}

