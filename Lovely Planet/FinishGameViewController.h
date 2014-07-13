//
//  FinishGameViewController.h
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "GameStartViewController.h"
#import "PlayGameViewController.h"


@interface FinishGameViewController : UIViewController{
    IBOutlet UILabel *piyokekka;
    int nowHeartPoint;

}

-(IBAction)onemore;
-(IBAction)finish;



@end
