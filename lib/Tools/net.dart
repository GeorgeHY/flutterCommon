import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_common/Base/BaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

enum Method {
  get,
  post
}

class Net {
  //工厂模式
  factory Net() => _getInstance();
  static Net get instance => _getInstance();
  static Net _instance;

  http.Client client;
  Map<String,String> header;

  var tokenStr;

  Net._internal() {
    client = http.Client();
    header = {'content-type':'application/x-www-form-urlencoded'};
    // client.head(headers {'content-type':'application/x-www-form-urlencoded'});
    //初始化
    // client.he
    // dio = Dio(BaseOptions(
    //     contentType: Headers.formUrlEncodedContentType,
    //     connectTimeout: 60000,  //连接服务器超时时间，单位是毫秒
    //     // receiveTimeout: 10000,  //响应流上前后两次接受到数据的间隔，单位为毫秒，这并不是接收数据的总时限
    //   )
    // );
  }

  //单例模式
  static Net _getInstance() {
    if (_instance == null) {
      _instance = Net._internal();
    }
    return _instance;
  }

  //get请求
  get(String url, Map<String,dynamic> params,{bool withToken = false,Function success,Function failure}){
    _doRequest(url, params,withToken, Method.get, success, failure);
  }

  //post请求
  post(String url, Map<String,dynamic> params, {bool withToken = false,Function success,Function failure}){
    _doRequest(url, params,withToken, Method.post, success, failure);
  }

  //上传单张图片
  uploadSingleImage(String url, File file, Map<String,dynamic> params, {String loadingText,Function success,Function failure}){
    _doUploadFile(url, file, params, loadingText, success, failure);
  }


  void _doRequest(String url,Map<String,dynamic> params,bool withToken ,Method method ,Function successCallBack,Function failureCallBack) async{
    try{
      List<String> pathArr = url.split("/");

      if (withToken) {
        if (params.keys.contains("token")) {
          header.addAll({'Authorization':params["token"]});
          params.remove("token");
        }else{
          await getToken().then((result) {
            print("$result");
            header.addAll({'Authorization':result});
          });
        }
      }
      // print("header = $header");


      http.Response response;
      switch (method){
        case Method.get:
          if(params != null && params.isNotEmpty){
            var paramStr = "?";
            params.forEach((key, value) {
              paramStr = paramStr + key + '=$value&';
            });
            print('get param = $paramStr');
            response = await client.get(url+paramStr,headers: header);
          }else{
            response = await client.get(url,headers: header);
          }
          break;
        case Method.post:
          // print(dio.options.headers['Authorization']);
          if(params != null && params.isNotEmpty){
            response = await client.post(url,body: params,headers: header);
          }else{
            response = await client.post(url,headers: header);
          }
          break;
      }

      Map<String,dynamic> result = json.decode(response.body);
      
      print('''api: $url\nparams: $params\nresult: $result''');

      //转化为model
      BaseModel model = BaseModel.fromJson(result);
      if (!url.contains("profile") && model.code == 401) {
        ///需要登录 ,个人中心首页不跳转
        // navigatorKey.currentState.pushNamedAndRemoveUntil("signInPage", ModalRoute.withName("homeTab"));
      }
      //TODO:- 暂不判断登录过期状态
      // if (4003 == model.code || 4004 == model.code) {
      //   print("请登录");
      //   RouterEx.navigatorKey.currentState.pushNamed("signInPage");
      //   // RouterEx.navigatorKey.currentState.pushNamedAndRemoveUntil("signInPage", (route) => Route());
      //   return;
      // }


      if (response.statusCode == 200) { //200请求成功
        if (successCallBack != null){
          successCallBack(model.data);
        }

      }else{
        //TODO: - 直接使用Toast弹出错误信息
        //返回失败信息
        if (failureCallBack != null) {
          failureCallBack(model.msg);
        }
      }
    }catch (exception) {
      log('错误：${exception.toString()}');
      if (failureCallBack != null){
        failureCallBack(exception.toString());
      }
    }
  }

  //上传文件（图片）
  void _doUploadFile(String url, File file,Map<String,dynamic> params, String loadingText,Function successCallBack,Function failureCallBack) async {
    try {
      // String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String fileName = file.path.split('/').last;
      // Map param;

      // params['user_head'] =  await MultipartFile.fromFile(file.path,filename: fileName);

      // FormData formData = FormData.fromMap({
      //   'username':'kid',
      //   'blurb':'test3',
      //   'file':await MultipartFile.fromFile(file.path,filename: fileName),
      // });

      // FormData formData = FormData.fromMap(params);
      // FormData formData = FormData.fromMap({
      //   'file': await MultipartFile.fromFile("",filename: '$timeStamp.png'),
      //
      //
      //   // 'file':(file,'$timeStamp.jpg',
      //   //   contentTy
      //   // )
      // });
      // formData. =
      getToken().then((result) {
        print("$result");
        // dio.options.headers.addAll({'Authorization':result});
      });

      // Response response;
      // // response = await dio.post(url,data: formData);
      // Map<String,dynamic> result = json.decode(response.toString());
      //
      // print('''api: $url\nparams: $params\nresult: $result''');
      //
      //
      // //转化为model
      // BaseModel model = BaseModel.fromJson(result);
      //
      //
      // if (model.code == 200) { //200请求成功
      //   if (successCallBack != null){//返回请求数据
      //     if (url.contains('emai_login')) {
      //       successCallBack(model.token);
      //     }else{
      //       // Fluttertoast.showToast(msg: model.message);
      //       successCallBack(model.info);
      //     }
      //   }
      // }else{
      //   //TODO: - 直接使用Toast弹出错误信息
      //
      //   //返回失败信息
      //   if (failureCallBack != null) {
      //     failureCallBack(model.msg);
      //   }
      //
      //
      //
      // }


    }catch (exception) {
      log('错误：${exception.toString()}');
      if (failureCallBack != null){
        failureCallBack(exception.toString());
      }
    }
  }

  ///获取token
  Future<String> getToken() async{
    var tokenStr;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenStr = prefs.getString("kToken");
    return tokenStr;
  }

  ///保存用户信息
  // Future saveUserInfo(MyInfoModel model) async{
  //   var str = json.encode(model);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("kUserInfo", str);
  //
  // }
}