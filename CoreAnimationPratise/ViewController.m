//
//  ViewController.m
//  CoreAnimationPratise
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Myteam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    //UIButton *button;
    NSMutableArray *btnArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    //第一次修改的
     btnArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 6; i ++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectGetHeight(self.view.frame)-100, 50, 50)];
        btn.tag = i;
        btn.layer.cornerRadius = 25;
        btn.layer.masksToBounds = YES;
        
    //[btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //[btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
        [btnArray addObject:btn];
        [self.view addSubview:btn];
        
    }
    
   UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(45, CGRectGetHeight(self.view.frame)-105, 60, 60)];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    button.layer.cornerRadius = 30;
    button.layer.masksToBounds = YES;
    button.selected = YES;
    _isSelected = YES;
    [self.view addSubview:button];
    //屏幕大小
    NSLog(@"%@",NSStringFromCGSize(self.view.bounds.size));
    
}

//大按钮
-(void)buttonClick:(UIButton *)button
{
    
    _isSelected = !_isSelected;
    button.selected = !button.selected;
    if (_isSelected==0)
    {
        for (UIButton *btn in btnArray)
        {
           
            [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotateAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:M_PI * 2],[NSNumber numberWithFloat:0.0f], nil];
            rotateAnimation.duration = 0.5f;
            rotateAnimation.keyTimes = [NSArray arrayWithObjects:
                                        [NSNumber numberWithFloat:.0],
                                        [NSNumber numberWithFloat:.4],
                                        [NSNumber numberWithFloat:.5], nil];
            
            CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            positionAnimation.duration = 0.5f;
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, 75, CGRectGetHeight(self.view.frame)-75);
            CGPathAddLineToPoint(path, NULL, 75+180*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-180*sin(btn.tag*18*M_PI/180));
            CGPathAddLineToPoint(path, NULL, 75+220*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-220*sin(btn.tag*18*M_PI/180));
            CGPathAddLineToPoint(path, NULL, 75+200*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-200*sin(btn.tag*18*M_PI/180));
            btn.frame = CGRectMake(75+200*cos(btn.tag*18*M_PI/180)-25, CGRectGetHeight(self.view.frame)-75-200*sin(btn.tag*18*M_PI/180)-25, btn.bounds.size.width, btn.bounds.size.height);
            positionAnimation.path = path;
            CGPathRelease(path);
            
            CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
            animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, rotateAnimation, nil];
            animationgroup.duration = 0.5f;
            animationgroup.fillMode = kCAFillModeForwards;
            animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            animationgroup.removedOnCompletion =NO;
            animationgroup.fillMode = kCAFillModeForwards;
            [btn.layer addAnimation:animationgroup forKey:@"aa"];
        }
        
        
    }else
    {
        
        for (UIButton *btn in btnArray)
        {
            CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotateAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:M_PI * 2],[NSNumber numberWithFloat:0.0f], nil];
            rotateAnimation.duration = 0.5f;
            rotateAnimation.keyTimes = [NSArray arrayWithObjects:
                                        [NSNumber numberWithFloat:.0],
                                        [NSNumber numberWithFloat:.3],
                                        [NSNumber numberWithFloat:.4],
                                        [NSNumber numberWithFloat:.5], nil];
            
            CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            positionAnimation.duration = 0.5f;
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, 75+200*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-200*sin(btn.tag*18*M_PI/180));
            
            CGPathAddLineToPoint(path, NULL, 75+200*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-200*sin(btn.tag*18*M_PI/180));
            CGPathAddLineToPoint(path, NULL, 75+220*cos(btn.tag*18*M_PI/180), CGRectGetHeight(self.view.frame)-75-220*sin(btn.tag*18*M_PI/180));
            CGPathAddLineToPoint(path, NULL, 75, CGRectGetHeight(self.view.frame)-75);
            //CGPathAddLineToPoint(path, NULL, 75, CGRectGetHeight(self.view.frame)-75);
            positionAnimation.path = path;
            CGPathRelease(path);
            
            CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
            animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, rotateAnimation, nil];
            animationgroup.duration = 0.5f;
            animationgroup.fillMode = kCAFillModeForwards;
            animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            animationgroup.removedOnCompletion =NO;
            animationgroup.fillMode = kCAFillModeForwards;
            [btn.layer addAnimation:animationgroup forKey:@"aa"];
            
        }
        
        
        
    }
    
    
}
//小按钮
-(void)buttonAction:(UIButton *)btn
{
    _isSelected = !_isSelected;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.5;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    for (UIButton *button in btnArray)
    {
        if (button.tag == btn.tag)
        {
            //放大
            CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"transform"];
            a1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)];
            CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
            a2.toValue = [NSNumber numberWithFloat:0.0f];
            
            group.animations = @[a1,a2];
            [button.layer addAnimation:group forKey:@"aa"];
            
            NSLog(@"index:%ld",(long)button.tag);
        }
        else
        {
            
            CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"transform"];
            a1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
            CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
            a2.toValue = @(0);
            
            group.animations = @[a1,a2];
            [button.layer addAnimation:group forKey:@"aa"];
            
        }
        
        
        
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
