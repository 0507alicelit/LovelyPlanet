//
//  RoomStageViewController.m
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import "RoomStageViewController.h"

@implementation RoomStageViewController

-(void)viewDidLoad{
    Roomfirst = [UIImage imageNamed:@"room1.png"];
    Roomsecond = [UIImage imageNamed:@"room2.png"];
    Roomthird = [UIImage imageNamed:@"room3.png"];
    Roombackfirst = [UIImage imageNamed:@"roomback1.png"];
    Roombacksecond = [UIImage imageNamed:@"roomback2.png"];
    Roombackthird = [UIImage imageNamed:@"roomback3.png"];
    
    roomgage0 = [UIImage imageNamed:@"roomgage0.png"];
    roomgage1 = [UIImage imageNamed:@"roomgage1.png"];
    roomgage2 = [UIImage imageNamed:@"roomgage2.png"];
    roomgage3 = [UIImage imageNamed:@"roomgage3.png"];
    roomgage4 = [UIImage imageNamed:@"roomgage4.png"];
    roomgage5 = [UIImage imageNamed:@"roomgage5.png"];
    
    NSLog(@"roomPoint = %d", roomPoint);
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = [pointUd integerForKey:@"point"];//読み込み2
    
    NSUserDefaults *RoomUd = [NSUserDefaults standardUserDefaults];//読み込み1
    roomPoint = [RoomUd integerForKey:@"Room"];//読み込み2
    
    RoomLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
    
    if(roomPoint < 150){
        RoomView.image = Roomfirst;
        NSLog(@"%@", @"first");
        BackgroundView.image = Roombackfirst;
    }
    if(roomPoint >= 150 && roomPoint < 600){
        RoomView.image = Roomsecond;
        NSLog(@"%@", @"second");
        BackgroundView.image = Roombacksecond;
    }
    if(roomPoint >= 600){
        RoomView.image = Roomthird;
        NSLog(@"%@", @"third");
        BackgroundView.image = Roombackthird;
    }
    
    if(roomPoint < 30 || (245 <= roomPoint && roomPoint < 295)){
        roomgage.image = roomgage0;
    }else if((30 <= roomPoint && roomPoint < 60) || (150 <= roomPoint && roomPoint < 200)){
        roomgage.image = roomgage1;
    }else if((60 <= roomPoint && roomPoint < 90) || (200 <= roomPoint && roomPoint < 250)){
        roomgage.image = roomgage2;
    }else if((90 <= roomPoint && roomPoint <120) || (250 <= roomPoint && roomPoint < 300)){
        roomgage.image = roomgage3;
    }else if((120 <= roomPoint && roomPoint < 150) || (300 <= roomPoint && roomPoint < 350)){
        roomgage.image = roomgage4;
    }else if(roomPoint >= 350){
        roomgage.image = roomgage5;
    }

}

-(IBAction)pour{
    if(heartpoint>0 && roomPoint < 350){
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint--;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSUserDefaults *RoomUd = [NSUserDefaults standardUserDefaults];//設定1
        roomPoint = (int)[RoomUd integerForKey:@"Room"];//設定2
        roomPoint++;
        [RoomUd setInteger:roomPoint forKey:@"Room"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        
        RoomLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
        
        if(roomPoint < 150){
            RoomView.image = Roomfirst;
            NSLog(@"%@", @"first");
            BackgroundView.image = Roombackfirst;
        }
        if(roomPoint >= 150 && roomPoint < 600){
            RoomView.image = Roomsecond;
            NSLog(@"%@", @"second");
            BackgroundView.image = Roombacksecond;
        }
        if(roomPoint >= 600){
            RoomView.image = Roomthird;
            NSLog(@"%@", @"third");
            BackgroundView.image = Roombackthird;
        }
        
        if(roomPoint < 30 || (150 <= roomPoint && roomPoint < 200)){
            roomgage.image = roomgage0;
        }else if((30 <= roomPoint && roomPoint < 60) || (200 <= roomPoint && roomPoint < 250)){
            roomgage.image = roomgage1;
        }else if((60 <= roomPoint && roomPoint < 90) || (250 <= roomPoint && roomPoint < 300)){
            roomgage.image = roomgage2;
        }else if((90 <= roomPoint && roomPoint <120) || (300 <= roomPoint && roomPoint < 350)){
            roomgage.image = roomgage3;
        }else if((120 <= roomPoint && roomPoint < 150) || (350 <= roomPoint && roomPoint < 400)){
            roomgage.image = roomgage4;
        }else if(roomPoint >= 400){
            roomgage.image = roomgage5;
            if(alertOff == 0){
                alertOff++;
                UIAlertView *alert =
                [[UIAlertView alloc]
                 initWithTitle:@""
                 message:@"クリアー！\n次のステージが解放されたよ！！"
                 delegate:nil
                 cancelButtonTitle:nil
                 otherButtonTitles:@"OK", nil
                 ];
                [alert show];
            }
        }
        // みゆっき
        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heartAnime" ofType:@"gif"]];
        YAPGif *gif = [[YAPGif alloc] initWithGifData:gifData];
        heartAnimeView.image = gif.image;
        [NSTimer scheduledTimerWithTimeInterval:[gif.seconds floatValue] target:self selector:@selector(heartFinish:) userInfo:nil repeats:NO];
        
    }
}

- (void)heartFinish:(NSTimer*)timer{
    //みゆっき
    heartAnimeView.image = nil;
}


-(IBAction)stage{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)game{
    GameStartViewController *gameStartVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameStart"];
    [self presentViewController:gameStartVC animated:YES completion:nil];
}


@end
