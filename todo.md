1. using one bootstrap theme
2. apply style to list table
3. RFx, how to hack rails's convension? -- using _ to sperate
4. simple_form dropdown list -- done
5. datepicker -- done
6. parent-child new
7. ajax partial render react_component ReactRailsUJS.mountComponents();

7. determine sourcing type
    + 对每个rfx，确定寻源方式
        + 招投标、询比价、竞争性谈判、单一来源
        + 招投标：公开、邀请；自主、代理
        + 邀请：邀请哪些供应商
        + 对寻源方式的审核；
    + 对每一个rfx，创建轮次，默认一轮；可以增加多轮；每轮开始时间/结束时间控制；
        + 轮次不改变寻源方式；
        + 对于邀请方式，轮次可以增加/供应商；
        + 仅是个时间窗口的控制，不作为外键约束；
    + 各轮综合结果，才是最终的结果；


1. main page
    + 公告
    + 相关链接（采招网，…………）

2. “公告”的后台编辑功能
    + 发布新公告：编辑内容，审批，发布；

3. 公告查看
    + 标题，发布时间，发布单位
    + 点击看详情，html展示，还有附件可下载；

4. 用户管理
    + 用户注册，
    + 登录，退出；
    + 查看/修改基本信息：邮箱，上传头像
    + 修改密码；
    + 找回密码；


5. 权限管理
    + 功能权限：对应到action，
    + 数据权限

6. 给我们留言
    + 网站层级；
    + 某个具体的rfx层级； -- 根据类型区分
    + 查看我的留言；-- 已经提交，不能修改；

    + 做个简单的评论，任何一个东西，都可以留言，可以对留言回复（记录关联号）。
        + 类型，关联id；
        + 当前用户（名称，头像），标题，标签，内容，
        + 提交；


    宽容比自由重要



2. in react
    + inital data: can passed in as props.
    + state data: during interaction handled by react.
    + post url: should also be passed as props.
        + in rails view, pass xxx_path to react


3. how to get value back from react?  put it into the from and then can be submited by rails?

// good
render() {
  var classes = {
    'MyComponent': true,
    'MyComponent--active': this.state.active
  };

  <div className={classNames(classes)} />;
}

4. className

```
render: function() {
  var cx = React.addons.classSet;
  var classes = cx({
    'message': true,
    'message-important': this.props.isImportant,
    'message-read': this.props.isRead
  });
  // same final string, but much cleaner
  return <div className={classes}>Great, I'll be there.</div>;
}

render: function() {
  var cx = React.addons.classSet;
  var importantModifier = 'message-important';
  var readModifier = 'message-read';
  var classes = cx('message', importantModifier, readModifier);
  // Final string is 'message message-important message-read'
  return <div className={classes}>Great, I'll be there.</div>;
}
```

[react-rails samples](http://codeloveandboards.com/blog/2014/09/10/rails-and-react-ii-a-real-use-case/)


1. state 中能不能再有 object? 可以有
2. radio-check box 如何根据变量设置初始值？ -- too tedious

1. comment
  + 的显示格式；name, date, comment -- 参考案例 模板
  + 两个comment之间的一级关联；



``` ruby
  #self association
  belongs_to :parent, class_name: :AnalysisArea
  has_many :sons, class_name: :AnalysisArea, foreign_key: :parent_id

  # 1:m
  pi.analysis_method_ids = [1,2,3]
  xx_ids;
```


# 20150818
1. [#165 Edit Multiple (revised)](http://railscasts.com/episodes/165-edit-multiple-revised?view=asciicast)

2. [#196 Nested Model Form (revised)](http://railscasts.com/episodes/196-nested-model-form-revised)


1. simple_form_for
  1. button txt; f.button 的显示；
  2. new, update: Update User, Create User 的生成逻辑；