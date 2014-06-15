//
//  TableViewController.h
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageSelectViewController.h"
#import "GameStartViewController.h"
#import "YAPGif/YAPGif.h"

@interface TableViewController : UIViewController{
    
    int TablePoint;
    int alertOff;
    IBOutlet UILabel *TableLabel;
    IBOutlet UIImageView *TableView;
    IBOutlet UIImageView *BackgroundView;
    IBOutlet UIImageView *tablegage;
    IBOutlet UIImageView *heartAnimeView;
    NSMutableArray *TableArray;
    UIImage *Tablefirst;
    UIImage *Tablesecond;
    UIImage *Tablethird;
    UIImage *Tablebackfirst;
    UIImage *Tablebacksecond;
    UIImage *Tablebackthird;
    UIImage *tablegage0;
    UIImage *tablegage1;
    UIImage *tablegage2;
    UIImage *tablegage3;
    UIImage *tablegage4;
    UIImage *tablegage5;

}

-(IBAction)pour;

-(IBAction)stage;
-(IBAction)game;


@end
