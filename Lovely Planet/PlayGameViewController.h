//
//  PlayGameViewContoroller.h
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

int point;

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "FinishGameViewController.h"


@interface PlayGameViewController : UIViewController{

    int heartpoint;
    int nowHeartPoint;
    IBOutlet UILabel *piyotimelabel;
    IBOutlet UILabel *piyohantei;
    IBOutlet UILabel *Pointlabel;
    IBOutlet UIImageView *hit;
    IBOutlet UIImageView *countDownView;
    float piyotime;
    float piyokasoku;
    float appear;
    NSTimer *piyotimer;
    float piyoSpeed;
    UIImage *piyoyellow;
    UIImage *piyopink;
    UIImage *piyogray;
    UIImage *piyoblue;
    UIImage *piyoorange;
    UIImage *piyoyellowpa;
    UIImage *piyopinkpa;
    UIImage *piyograypa;
    UIImage *piyobluepa;
    UIImage *piyoorangepa;
    UIImage *countdown1;
    UIImage *countdown2;
    UIImage *countdown3;
    UIImageView *piyoview;
    NSMutableArray *piyoArray;
    NSTimer *timer;
    int count;
    int piyocolor;
    float piyoRect;

    float yoko;

    int piyoCount;
    
    //増原
    float div;
}

-(IBAction)eggYellow;
-(IBAction)eggOrange;
-(IBAction)eggBlue;
-(IBAction)eggPink;
-(IBAction)eggGlay;

@end
