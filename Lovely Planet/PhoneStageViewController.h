//
//  StageViewController.h
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "GameStartViewController.h"
#import "YAPGif/YAPGif.h"


@interface PhoneStageViewController : UIViewController{
    
    int PhonePoint;
    int alertOff;
    IBOutlet UILabel *PhoneLabel;
    IBOutlet UIImageView *PhoneView;
    IBOutlet UIImageView *BackgroundView;
    IBOutlet UIImageView *heartAnimeView;
    NSMutableArray *PhoneArray;
    UIImage *phonefirst;
    UIImage *phonesecond;
    UIImage *phonethird;
    UIImage *phonebackfirst;
    UIImage *phonebacksecond;
    UIImage *phonebackthird;
    IBOutlet UIImageView *Phonegage;
    UIImage *phonegage0;
    UIImage *phonegage1;
    UIImage *phonegage2;
    UIImage *phonegage3;
    UIImage *phonegage4;
    UIImage *phonegage5;
}

-(IBAction)pour;

-(IBAction)stage;
-(IBAction)game;

@end
