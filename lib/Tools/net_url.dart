class NetUrl {
  ///服务器地址
  static const String BASE_URL = "https://www.yunbapan.com/app";
  ///图片基址
  static const String IMG_BASE_URL = "https://img.huagirl.com/";
  ///注册接口
  static const String SignUp = BASE_URL + '/signup';
  ///登录接口
  static const String SignIn = BASE_URL + '/signin';

  ///首页
  ///首页分类标题
  static const String HomeTags = BASE_URL + "/tags";
  ///首页分类视频列表
  static const String TagVideoList = BASE_URL + "/video_list";
  ///获取视频地址
  static const String VideoPath = BASE_URL + "/get_video";
  ///点赞视频
  static const String LikeVideo = BASE_URL + "/fav";
  ///取消点赞视频
  static const String UnLikeVideo = BASE_URL + "/unfav";
  ///获取视频评论(子评论)
  static const String CommentList = BASE_URL + "/get_comment";
  ///发表评论
  static const String SendComment = BASE_URL + "/add_comment";
  ///点赞评论
  static const String CommentFav = BASE_URL + "/comment_fav";
  ///取消点赞评论
  static const String CommentUnFav = BASE_URL + "/comment_unfav";
  ///删除评论
  static const String DelComment = BASE_URL + "/del_comment";

  ///视频
  ///观看最多
  static const String PhotographyMost = BASE_URL + "/photography/photography_most";
  ///列表
  static const String PhotographyList = BASE_URL + "/Photography/photography_list";
  // ///详情
  // static const String Photo_Details = BASE_URL + "/index/details";
  // ///收藏
  // static const String Photo_Favourite = BASE_URL + "/setup/hits";


  ///写真
  ///观看最多
  static const String PortraitMost = BASE_URL + "/portrait/portrait_most";
  ///列表
  static const String PortraitList = BASE_URL + "/portrait/portrait_list";
  ///详情
  static const String Photo_Details = BASE_URL + "/index/details";
  ///收藏
  static const String Photo_Favourite = BASE_URL + "/setup/hits";


  ///我的
  ///喜欢专辑列表
  static const String FavList = BASE_URL + "/fav_list";
  ///个人信息
  static const String Profile = BASE_URL + "/profile";
  // ///修改个人信息
  // static const String InfoUpdate = BASE_URL + "/setup/info_update";
  ///修改密码
  static const String PwdUpdate = BASE_URL + "/change_pwd";
}