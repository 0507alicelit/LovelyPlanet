//
//  StageSelectViewController.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "StageSelectViewController.h"

@implementation StageSelectViewController

-(void)viewDidLoad{
     [super viewDidLoad];
    //door image set
    openDoor = [UIImage imageNamed:@"door02.png"];
    closeDoor = [UIImage imageNamed:@"door2"];
    lockDoor = [UIImage imageNamed:@"door1.png"];
    clearDoor = [UIImage imageNamed:@"door3.png"];
    clearOpenDoor = [UIImage imageNamed:@"door03.png"];
    
    //phone door image change
    if (PhonePoint < 20) {
        phoneDoor.image = closeDoor;
    }else if(PhonePoint >= 20){
        phoneDoor.image = clearDoor;
    }
    
    //table door image change
    if(PhonePoint < 20){
        tableDoor.image = lockDoor;
    }else if (PhonePoint >= 20 && TablePoint < 75){
        tableDoor.image = closeDoor;
    }else if(TablePoint >= 75){
        tableDoor.image = clearDoor;
    }
    
    //room door image change
    if(PhonePoint < 20){
        roomDoor.image = lockDoor;
    }else if (PhonePoint >= 20 && RoomPoint < 600){
        roomDoor.image = closeDoor;
    }else if(RoomPoint >= 600){
        roomDoor.image = clearDoor;
    }
    
    //home door image change
    if(TablePoint < 75 && RoomPoint < 600){
        homeDoor.image = lockDoor;
    }else if (TablePoint >= 75 && RoomPoint >= 600 && HomePoint < 850){
        homeDoor.image = closeDoor;
    }else if(HomePoint >= 850){
        homeDoor.image = clearDoor;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = (int)[pointUd integerForKey:@"point"];//読み込み2
    
    NSUserDefaults *PhoneUd = [NSUserDefaults standardUserDefaults];//読み込み1
    PhonePoint = (int)[PhoneUd integerForKey:@"Phone"];//読み込み2
    
    NSUserDefaults *TableUd = [NSUserDefaults standardUserDefaults];//読み込み1
    TablePoint = (int)[TableUd integerForKey:@"Table"];//読み込み2
    
    NSUserDefaults *RoomUd = [NSUserDefaults standardUserDefaults];//読み込み1
    RoomPoint = (int)[RoomUd integerForKey:@"Room"];//読み込み2
    
    NSUserDefaults *HomeUd = [NSUserDefaults standardUserDefaults];//読み込み1
    HomePoint = [HomeUd integerForKey:@"Home"];//読み込み2
    
    heartLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
    
    NSLog(@"%d変更後", heartpoint);
    
    if (PhonePoint < 20) {
        phoneDoor.image = closeDoor;
        NSLog(@"CloseDoor");
    }else if(PhonePoint >= 20){
        phoneDoor.image = clearDoor;
        NSLog(@"ClearDoor");
    }
    
    if(PhonePoint < 20){
        tableDoor.image = lockDoor;
    }else if (PhonePoint >= 20 && TablePoint < 75){
        tableDoor.image = closeDoor;
    }else if(TablePoint >= 75){
        tableDoor.image = clearDoor;
    }
    
    if(PhonePoint < 20){
        roomDoor.image = lockDoor;
    }else if (PhonePoint >= 20 && RoomPoint < 600){
        roomDoor.image = closeDoor;
    }else if(RoomPoint >= 600){
        roomDoor.image = clearDoor;
    }
    
    if(TablePoint < 75 && RoomPoint < 600){
        homeDoor.image = lockDoor;
    }else if (TablePoint >= 75 && RoomPoint >= 600 && HomePoint < 850){
        homeDoor.image = closeDoor;
    }else if(HomePoint >= 850){
        homeDoor.image = clearDoor;
    }
    
   
}

-(IBAction)phoneDoor{
    if(PhonePoint < 10){
        phoneDoor.image = openDoor;
    }else if(PhonePoint >= 10){
        phoneDoor.image = clearOpenDoor;
    }
    PhoneStageViewController *phoneStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Phone"];
    [self presentViewController:phoneStageVC animated:YES completion:nil];
}
-(IBAction)tableDoor{
    if(PhonePoint >= 20){
        if(TablePoint < 75){
            tableDoor.image = openDoor;
        }else if(TablePoint >= 20){
            tableDoor.image = clearOpenDoor;
        }
        TableViewController *tableStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Table"];
        [self presentViewController:tableStageVC animated:YES completion:nil];
    }else{
        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@""
         message:@"まだ行けないよ><\nPhoneステージクリアでアンロック"
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil
         ];
        [alert show];
    }
}
-(IBAction)roomDoor{
    if(PhonePoint >= 20){
        if(RoomPoint < 350){
            roomDoor.image = openDoor;
        }else if(RoomPoint >= 350){
            roomDoor.image = clearOpenDoor;
        }
        RoomStageViewController *roomStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Room"];
        [self presentViewController:roomStageVC animated:YES completion:nil];
    }else{
        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@""
         message:@"まだ行けないよ><\nPhoneステージクリアでアンロック"
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil
         ];
        [alert show];
    }
}

-(IBAction)homeDoor{
    if(TablePoint >= 75 && RoomPoint >= 350){
        if(HomePoint < 850){
            homeDoor.image = openDoor;
        }else if(HomePoint >= 850){
            homeDoor.image = clearOpenDoor;
        }
        HomeStageViewController *homeStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
        [self presentViewController:homeStageVC animated:YES completion:nil];
    }else{
        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@""
         message:@"まだ行けないよ><\nTable、Roomステージクリアでアンロック"
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil
         ];
        [alert show];
    }
}

-(IBAction)game{
    GameStartViewController *gameStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameStart"];
    [self presentViewController:gameStageVC animated:YES completion:nil];
}

@end
