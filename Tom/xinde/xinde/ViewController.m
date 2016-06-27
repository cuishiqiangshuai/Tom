//
//  ViewController.m
//  xinde
//
//  Created by qingyun on 16/3/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tupian;
@property(strong,nonatomic)AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tou:(UIButton *)sender {
    NSURL *url=[NSURL]
    _player=[[AVPlayer alloc] initWithURL:url];
    NSMutableArray *mulArr=[NSMutableArray array];
    for (int i=0; i<81; i++) {
        NSString *imgname=[NSString stringWithFormat:@"knockout_%02d.jpg",i];
        UIImage *img=[UIImage imageNamed:imgname];
        [mulArr addObject:img];
    }
    _tupian.animationImages=mulArr;
    _tupian.animationDuration=81*0.1;
    _tupian.animationRepeatCount=1;
    [_tupian startAnimating];
}


@end
