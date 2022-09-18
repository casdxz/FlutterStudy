class Task {
  final String taskName;
  final String description;
  final DateTime taskTime;
  final bool isDone;

  Task(
    this.taskName,
    this.description,
    this.taskTime,
    this.isDone,
  );
}

List<Task> listTask = [
  Task(
    '跑步',
    '有氧运动',
    DateTime(2022, 9, 20, 7, 30),
    false,
  ),
  Task(
      '网络会议',
      '编程俱乐部周会',
      DateTime(2022, 9, 20, 10, 00),
      false,
  ),
  Task(
      '追剧',
      '芒果TV',
      DateTime(2022, 9, 20, 12, 30),
      false,
  ),
  Task(
      '写材料',
      '项目申报材料',
      DateTime(2022, 9, 20, 15, 30),
      false,
  ),
  Task(
      '学习新技术',
      '微服务技术栈学习',
      DateTime(2022, 9, 20, 17),
      false,
  ),
  Task(
      '茶颜悦色',
      '幽蓝拿铁双倍奶油',
      DateTime(2022, 9, 17, 11),
      true,
  ),
  Task(
      '健康上报',
      '企业微信',
      DateTime(2022, 9, 18, 8),
      true,
  ),
];