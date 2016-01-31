# AutoLayoutDemo
AutoLayoutDemo
![cell.png](http://upload-images.jianshu.io/upload_images/1121012-f905d12eb3e9e42d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
上面举个简单例子，cell内部只有两个控件，一个ImageView和Label，说下需求：
- 假设UI给的效果图是6p的，图片在6p上是100*100的，在别的屏幕按比例缩放。
- label的字数不固定。
- label可能显示或隐藏，cell需要根据label的显示和隐藏去适应高度。

先来一步步来实现上面三个需求....

#####一、子控件根据父控件比例缩放
1、先在xib中拖出上面两个控件，选中图片，设置距离cell上面和左边的边距都为10，图片的x和y已经确定了，这里就不上图了，大家应该知道。
2、为了图片不变形，先设置图片相对自身的宽高比，选中图片，往自身拖出约束，选择Aspect Ratio
![Snip20160131_16.png](http://upload-images.jianshu.io/upload_images/1121012-e6fb1209ccb72ddf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![Snip20160131_14.png](http://upload-images.jianshu.io/upload_images/1121012-7019896c037a45d9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
再选中刚刚添加的约束，在右边栏按图编辑好对应宽高比，这里设置宽高1：1。
![Snip20160131_7.png](http://upload-images.jianshu.io/upload_images/1121012-225b2c6a7e2b9d83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3、接下来是按屏幕宽度缩放，选中图片拖向它所在的父控件，这里的父控件就是contentView，同样选择Aspect Ratio。
![](http://upload-images.jianshu.io/upload_images/1121012-44659c63e2186376.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
选中约束还是在右边栏去编辑好，如下图，这里是相对6p的效果图，所以设置100：414，需求的第一步已经完成了。
![Snip20160131_17.png](http://upload-images.jianshu.io/upload_images/1121012-391a0549a3e604c8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#####二、Label内容自适应
1、还是先设置Label上部距离图片底部边距以及距离父控件左、右侧边距，这三个约束已经给定label内容显示的最大宽度。
2、很重要的一步，选中label在上面栏点击Editor，选中Size to Fit Content，或者使用快捷键com = ，意味着label的尺寸根据它的内容去适应，根据你上一步给定的那个宽度去折行，同时记得label的行数设置为0。
![Snip20160131_18.png](http://upload-images.jianshu.io/upload_images/1121012-5af4f65e5b1aae7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3、很显然现在运行cell的高度是不会根据内容适应高度的，再label添加一个下面距离父控件的约束，这里也是设为10的边距，现在
cell的高度 =  图片的上边距 + 图片高度 + 文字和图片边距 + 文字高度 + 文字下面距离父控件边距，是不是有些像我们平时使用Auto Layout设置scrollView的约束，你可以这么理解，父控件的内容根据子控件去撑满。
![Snip20160131_19.png](http://upload-images.jianshu.io/upload_images/1121012-de82a5896b976253.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
最后还需要一行代码，也是最关键的一步，设置tableView的estimatedRowHeight，顾名思义就是预设的行高，你可以随意设置一个值，这样前两个需求就做完了，Auto Layout已经帮我们计算好了行高，是不是很方便才写了一行代码。
```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.example1TableView.estimatedRowHeight = 100;
}

```
#####三、设置约束优先级
先简单介绍一下约束优先级，具有优先级1000（UILayoutPriorityRequired）的约束为强制约束（Required Constraint），也就是必须要满足的约束；优先级小于1000的约束为可选约束（Optional Constraint）。默认创建的是强制约束。它分为
高优先级：UILayoutPriorityDefaultHigh，
低优先级：UILayoutPriorityDefaultLow，
内置的最低优先级：UILayoutPriorityFittingSizeLevel
```
typedef float UILayoutPriority;
static const UILayoutPriority UILayoutPriorityRequired NS_AVAILABLE_IOS(6_0) = 1000; // A required constraint.  Do not exceed this.
static const UILayoutPriority UILayoutPriorityDefaultHigh NS_AVAILABLE_IOS(6_0) = 750; // This is the priority level with which a button resists compressing its content.
static const UILayoutPriority UILayoutPriorityDefaultLow NS_AVAILABLE_IOS(6_0) = 250; // This is the priority level at which a button hugs its contents horizontally.
static const UILayoutPriority UILayoutPriorityFittingSizeLevel NS_AVAILABLE_IOS(6_0) = 50; // When you send -[UIView systemLayoutSizeFittingSize:], the size fitting most closely to the target size (the argument) is computed.  UILayoutPriorityFittingSizeLevel is the priority level with which the view wants to conform to the target size in that computation.  It's quite low.  It is generally not appropriate to make a constraint at exactly this priority.  You want to be higher or lower.
```

现在我们想当label隐藏时图片距离cell的底部也为10，现在就需要再添加一条图片距离cell底部为10的下边距，这时候我们发现会有冲突，选中这条约束把优先级设置得低一些，会发现冲突消失了，约束变成了虚线，把之前图片相对label的边距的约束拖到.h中作为cell的属性。
![Snip20160131_20.png](http://upload-images.jianshu.io/upload_images/1121012-6b5d4a9306b145f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
在tableview代理方法里面判断label显示或隐藏来修改优先级
```
cell.imageBotton.priority = cell.label.hidden ? UILayoutPriorityDefaultLow : UILayoutPriorityDefaultHigh;
```
当label隐藏时把优先级设置为UILayoutPriorityDefaultLow，显示时设置UILayoutPriorityDefaultHigh，只要是比图片底部相对父控件边距那条约束低就行了。
这里有一个注意点：
- 不允许将优先级由小于1000的值改为1000，例如，如果将优先级由250修改为1000，则会抛出异常，控制台会打印以下:
![Snip20160131_1.png](http://upload-images.jianshu.io/upload_images/1121012-0f0817fbf8192bf2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
所有操作都做完了，现在运行效果如下：
![result.gif](http://upload-images.jianshu.io/upload_images/1121012-cc02ac7658ccb9f8.gif?imageMogr2/auto-orient/strip)
最后是这次的代码：
https://github.com/ShelinShelin/AutoLayoutDemo
之前的一些例子请点击：
https://github.com/ShelinShelin 欢迎右上角⭐️Star，谢谢！
