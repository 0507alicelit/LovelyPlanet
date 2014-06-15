//
//  StageSelectViewController.h
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//
int heartpoint;
int stagecount;

#import <UIKit/UIKit.h>
#import "PhoneStageViewController.h"
#import "TableViewController.h"
#import "RoomStageViewController.h"
#import "HomeStageViewController.h"
#import "GameStartViewController.h"
#import "PlayGameViewController.h"
#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>


@interface StageSelectViewController : UIViewController{
    IBOutlet UILabel *heartLabel;
//    IBOutlet UIImageView *doorAnimeView;
//    NSArray *animeArray;
    int heartpoint;
    int PhonePoint;
    int TablePoint;
    int RoomPoint;
    int HomePoint;
    int point;
    
    IBOutlet UIImageView *phoneDoor;
    IBOutlet UIImageView *tableDoor;
    IBOutlet UIImageView *roomDoor;
    IBOutlet UIImageView *homeDoor;
    UIImage *openDoor;
    UIImage *closeDoor;
    UIImage *lockDoor;
    UIImage *clearDoor;
    UIImage *clearOpenDoor;
}

-(IBAction)phoneDoor;
-(IBAction)tableDoor;
-(IBAction)roomDoor;
-(IBAction)homeDoor;
-(IBAction)game;

@end