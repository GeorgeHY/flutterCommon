import 'dart:io';

import 'net.dart';
import 'net_url.dart';


class NetUtil {
  ///注册
  static void signUp(Map<String,dynamic> params,{Function success, Function failure}) {
    Net().post(NetUrl.SignUp, params,success: success, failure: failure);
  }
  ///登录
  static void signIn(Map<String,dynamic> params,{Function success, Function failure}) {
    Net().post(NetUrl.SignIn, params,success: success, failure: failure);
  }

  ///首页分类
  static void homeTag({Function success,Function failure}) {
    Net().get(NetUrl.HomeTags,{}, withToken: false,success: success,failure: failure);
  }
  ///分类视频列表
  static void tagVideoList(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().get(NetUrl.TagVideoList,params, withToken: false,success: success,failure: failure);
  }
  ///获取视频播放地址
  static void videoPath(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.VideoPath,params, withToken: true,success: success,failure: failure);
  }
  ///点赞视频
  static void likeVideo(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.LikeVideo,params, withToken: true,success: success,failure: failure);
  }
  ///取消点赞视频
  static void unLikeVideo(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.UnLikeVideo,params, withToken: true,success: success,failure: failure);
  }
  ///获取视频评论
  static void videoComment(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().get(NetUrl.CommentList,params, withToken: true,success: success,failure: failure);
  }
  ///发表视频评论
  static void sendComment(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.SendComment,params, withToken: true,success: success,failure: failure);
  }
  ///点赞评论
  static void favComment(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.CommentFav,params, withToken: true,success: success,failure: failure);
  }
  ///取消点赞评论
  static void unFavComment(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.CommentUnFav,params, withToken: true,success: success,failure: failure);
  }
  ///删除评论
  static void delComment(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.DelComment,params, withToken: true,success: success,failure: failure);
  }

  ///视频
  ///视频首页观看最多
  static void getVideoHomeMostInfo({Function success,Function failure}) {
    Net().post(NetUrl.PhotographyMost,{}, withToken: true,success: success,failure: failure);
  }
  ///视频首页列表
  static void getVideoHomeList({Function success,Function failure}) {
    Net().post(NetUrl.PhotographyList,{}, withToken: true,success: success,failure: failure);
  }

  ///写真
  ///写真首页观看最多
  static void getPhotoHomeMostInfo({Function success,Function failure}) {
    Net().post(NetUrl.PortraitMost,{}, withToken: true,success: success,failure: failure);
  }
  ///写真首页列表
  static void getPhotoHomeList({Function success,Function failure}) {
    Net().post(NetUrl.PortraitList,{}, withToken: true,success: success,failure: failure);
  }

  ///写真详情
  static void getPhotoDetailInfo(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.Photo_Details,params, withToken: true,success: success,failure: failure);
  }

  ///收藏写真
  static void favouritePhoto(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.Photo_Favourite,params, withToken: true,success: success,failure: failure);
  }

  ///我的
  ///我收藏的
  static void myFavList(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.FavList,params, withToken: true,success: success,failure: failure);
  }

  ///个人中心个人信息
  static void userInfo({Map<String,dynamic> params,Function success,Function failure}) {
    Net().get(NetUrl.Profile,params, withToken: true,success: success,failure: failure);
  }
  ///修改个人信息
  // static void updateMyAccountInfo(Map<String,dynamic> params,{Function success,Function failure}) {
  //   Net().post(NetUrl.InfoUpdate,params, withToken: true,success: success,failure: failure);
  // }
  ///修改个人信息(含头像)
  // static void updateAccountInfoAndAvatar(Map<String,dynamic> params,File file,{Function success,Function failure}) {
  //   Net().uploadSingleImage(NetUrl.InfoUpdate, file, params,success: success,failure: failure);
  // }
  ///修改密码
  static void alterPwd(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.PwdUpdate,params, withToken: true,success: success,failure: failure);
  }

}
