//
//  RoomStageViewController.h
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "GameStartViewController.h"

@interface RoomStageViewController : UIViewController{
    
    int roomPoint;
    int alertOff;
    IBOutlet UILabel *RoomLabel;
    IBOutlet UIImageView *RoomView;
    IBOutlet UIImageView *BackgroundView;
    IBOutlet UIImageView *heartAnimeView;
    NSMutableArray *RoomArray;
    UIImage *Roomfirst;
    UIImage *Roomsecond;
    UIImage *Roomthird;
    UIImage *Roombackfirst;
    UIImage *Roombacksecond;
    UIImage *Roombackthird;
    IBOutlet UIImageView *roomgage;
    UIImage *roomgage0;
    UIImage *roomgage1;
    UIImage *roomgage2;
    UIImage *roomgage3;
    UIImage *roomgage4;
    UIImage *roomgage5;

}

-(IBAction)pour;

-(IBAction)stage;
-(IBAction)game;



@end
