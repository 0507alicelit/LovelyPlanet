//
//  ViewController.h
//  Lovely Planet
//
//  Created by ありす on 2013/10/09.
//  Copyright (c) 2013年 ありす. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIView+MDCBlink.h"
#import <ImageIO/ImageIO.h>
#import "UIImage+GIF.h"
#import "StageSelectViewController.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    NSMutableArray *heartArray;
    NSMutableArray *heartBtnArray;
    
    UIButton *heart;

    NSTimer *timer;
    
    int count;
    int hanten;
    int pata;
    
    IBOutlet UIButton *reset;
    
    IBOutlet UILabel *label;
}

-(IBAction)start;
// @property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UIImageView *heartImageArray;
@end
