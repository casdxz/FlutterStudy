class UpdateList {
  String appIcon; //App图标
  String appName; //App名称
  String appSize; //App大小
  String appDate; //App更新日期
  String appDescription; //App更新文案
  String appVersion; //App版本

  //构造函数语法糖，为属性赋值
  UpdateList({
    required this.appIcon,
    required this.appName,
    required this.appSize,
    required this.appDate,
    required this.appDescription,
    required this.appVersion,
  });
}

final List<UpdateList> items = [
  UpdateList(
    appIcon: 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Icon/Google%20Map.png',
    appName: 'Google Map',
    appSize: '89.3',
    appDate: '2022-09-02',
    appDescription: 'Google公司向全球提供的电子地图服务，地图包含地標、線條、形狀等信息，提供矢量地图、卫星照片、地形图等三种視图',
    appVersion: '5.19',
  ),
  UpdateList(
    appIcon: 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Icon/Ctrip.png',
    appName: '携程旅行',
    appSize: '99.3',
    appDate: '2022-09-08',
    appDescription:
    '携程甄选机票供您选择，机票航协认证，出票快速，官网机票预订,随订随走,还支持网上值机。豪华公务舱.更多优惠.特惠航线。',
    appVersion: '8.4.0',
  ),
  UpdateList(
    appIcon: 'https://bearcad.oss-cn-shanghai.aliyuncs.com/Icon/PPTV.png',
    appName: 'PP视频',
    appSize: '79.3',
    appDate: '2022-09-12',
    appDescription:
    '全球华人领先的、规模最大、拥有巨大影响力的视频媒体，全面聚合和精编影视、体育、娱乐、资讯等各种热点视频内容。',
    appVersion: '3.11.2',
  ),
];