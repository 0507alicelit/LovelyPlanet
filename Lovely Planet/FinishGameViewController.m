//
//  FinishGameViewController.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "FinishGameViewController.h"

@implementation FinishGameViewController
-(void)viewDidLoad{
    NSUserDefaults *nowPointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    nowHeartPoint = (int)[nowPointUd integerForKey:@"np"];//読み込み2
    piyokekka.text = [NSString stringWithFormat:@"%d点",nowHeartPoint];
}

-(IBAction)onemore{
    GameStartViewController *gameStartVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameStart"];
    [self presentViewController:gameStartVC animated:YES completion:nil];}
-(IBAction)finish{
    StageSelectViewController *stageSelectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"StageSelect"];
    [self presentViewController:stageSelectVC animated:YES completion:nil];
}

@end
