//
//  HomeStageViewController.h
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "GameStartViewController.h"

@interface HomeStageViewController : UIViewController{
    
    int homePoint;
    int alertOff;
    IBOutlet UILabel *HomeLabel;
    IBOutlet UIImageView *HomeView;
    IBOutlet UIImageView *BackgroundView;
    IBOutlet UIImageView *heartAnimeView;
    NSMutableArray *HomeArray;
    UIImage *Homefirst;
    UIImage *Homesecond;
    UIImage *Homethird;
    UIImage *Homebackfirst;
    UIImage *Homebacksecond;
    UIImage *Homebackthird;
    IBOutlet UIImageView *homegage;
    UIImage *homegage0;
    UIImage *homegage1;
    UIImage *homegage2;
    UIImage *homegage3;
    UIImage *homegage4;
    UIImage *homegage5;

}

-(IBAction)pour;

-(IBAction)stage;
-(IBAction)game;




@end
