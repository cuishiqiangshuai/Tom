//
//  ViewController.m
//  呵呵
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>// 音频框架

@interface ViewController ()
//图片全图属性
@property (weak, nonatomic) IBOutlet UIImageView *tupian;
//生命一个字典，接受plist文件
@property(strong,nonatomic)NSDictionary *myDic;
@property(strong,nonatomic)AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化字典
    // 1.获的plist所在路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"];
    NSLog(@"path:%@",path);
    //2.初始化字典
    _myDic=[NSDictionary dictionaryWithContentsOfFile:path];
//    NSLog(@"%@",_myDic);
    
}

//让所有按钮执行同一个方法
- (IBAction)hehe:(UIButton *)sender {

    //如果图片正在动画，则直接返回
    if (_tupian.isAnimating) {
        return;
       //屏蔽后面的代码
    }
//    NSLog(@"%@",[sender titleForState:(UIControlStateNormal)]);
    //动态获取按钮的标题
    NSString *title=[sender titleForState:(UIControlStateNormal)];
    int count=[_myDic[title] intValue];
    NSLog(@"count:%d",count);
    //设置OC的数组（就是图片库）
    NSMutableArray *mularr=[NSMutableArray array];
    //获取总的图片名
    for (int i=0; i<count; i++)
    {
        //设置图片名
        //NSString 表示OC的字符串对象，OC中方法的调用固定格式为：【类名/对象名+空格+方法名】
        NSString *imgname=[NSString stringWithFormat:@"%@_%02d.jpg",title,i];
        //封装为UIImage对象
        UIImage *img=[UIImage imageNamed:imgname];
        //把UIImage对象加入数组
        [mularr addObject:img];
    }
    //设置动画的数组( 就是图片库）
    _tupian.animationImages=mularr;
     // 张数和时间
    _tupian.animationDuration=0.1*count;
    //次数 （遍数）
    _tupian.animationRepeatCount=1;
    //开始
    [_tupian startAnimating];
    //关于播放音乐
    //1或的音频路径
    NSURL *musicUrl=[[NSBundle mainBundle] URLForResource:title withExtension:@"mp3"];
    if (musicUrl)
        //如果音频路径存在
    {
        // 通过url初始化播放器
        _player=[[AVPlayer alloc] initWithURL:musicUrl];
         //播放
        [_player play];
    }
}
    
@end
