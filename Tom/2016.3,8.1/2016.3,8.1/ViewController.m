//
//  ViewController.m
//  2016.3,8.1
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *quantu;
@property(strong,nonatomic)NSDictionary *myDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"];
    NSLog(@"path:%@",path);
    _myDic=[NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",_myDic);
}
- (IBAction)tou:(UIButton *)sender {
    if (_quantu.isAnimating) {
        return;
        NSLog(@"%@",[sender titleForState:(UIControlStateNormal)]);
        NSString *title=[sender titleForState:(UIControlState)]
    }
    NSMutableArray *mulArr=[NSMutableArray array];
    for (int i=0; i<81; i++) {
        NSString *imgname=[NSString stringWithFormat:@"knockout_%02d.jpg",i];
        UIImage *img=[UIImage imageNamed:imgname];
        [mulArr addObject:img];
    }
    _quantu.animationImages=mulArr;
    _quantu.animationDuration=81*0.1;
    _quantu.animationRepeatCount=1;
    [_quantu startAnimating];
}

@end
