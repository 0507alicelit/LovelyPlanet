//
//  StageViewController.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "PhoneStageViewController.h"

@implementation PhoneStageViewController

-(void)viewDidLoad{
    phonefirst = [UIImage imageNamed:@"iPhone1.png"];
    phonesecond = [UIImage imageNamed:@"iPhone2.png"];
    phonethird = [UIImage imageNamed:@"iPhone3.png"];
    phonebackfirst = [UIImage imageNamed:@"phoneback1.png"];
    phonebacksecond = [UIImage imageNamed:@"phoneback2.png"];
    phonebackthird = [UIImage imageNamed:@"phoneback3.png"];
    phonegage0 = [UIImage imageNamed:@"phonegage0.png"];
    phonegage1 = [UIImage imageNamed:@"phonegage1.png"];
    phonegage2 = [UIImage imageNamed:@"phonegage2.png"];
    phonegage3 = [UIImage imageNamed:@"phonegage3.png"];
    phonegage4 = [UIImage imageNamed:@"phonegage4.png"];
    phonegage5 = [UIImage imageNamed:@"phonegage5.png"];
    
    NSLog(@"phonepoint = %d", PhonePoint);
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = (int)[pointUd integerForKey:@"point"];//読み込み2
    
    NSUserDefaults *PhoneUd = [NSUserDefaults standardUserDefaults];//読み込み1
    PhonePoint = (int)[PhoneUd integerForKey:@"Phone"];//読み込み2
    
    PhoneLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
    
    if(PhonePoint < 5){
        PhoneView.image = phonefirst;
        NSLog(@"%@", @"first");
        BackgroundView.image = phonebackfirst;
    }
    if(PhonePoint >= 5 && PhonePoint < 20){
        PhoneView.image = phonesecond;
        NSLog(@"%@", @"second");
        BackgroundView.image = phonebacksecond;
    }
    if(PhonePoint >= 20){
        PhoneView.image = phonethird;
        NSLog(@"%@", @"third");
        BackgroundView.image = phonebackthird;
    }
    
    if(PhonePoint < 1 || (5 <= PhonePoint && PhonePoint < 8)){
        Phonegage.image = phonegage0;
    }else if((1 <= PhonePoint && PhonePoint < 2) || (8 <= PhonePoint && PhonePoint < 11)){
        Phonegage.image = phonegage1;
    }else if((2 <= PhonePoint && PhonePoint < 3) || (11 <= PhonePoint && PhonePoint < 14)){
        Phonegage.image = phonegage2;
    }else if((3 <= PhonePoint && PhonePoint < 4) || (14 <= PhonePoint && PhonePoint < 17)){
        Phonegage.image = phonegage3;
    }else if((4 <= PhonePoint && PhonePoint < 5) || (17 <= PhonePoint && PhonePoint < 20)){
        Phonegage.image = phonegage4;
    }else if(PhonePoint >= 20){
        Phonegage.image = phonegage5;
    }
}

-(IBAction)pour{
    if(heartpoint>0 && PhonePoint < 20){
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint--;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSUserDefaults *PhoneUd = [NSUserDefaults standardUserDefaults];//設定1
        PhonePoint = (int)[PhoneUd integerForKey:@"Phone"];//設定2
        PhonePoint++;
        [PhoneUd setInteger:PhonePoint forKey:@"Phone"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        PhoneLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
        
        if(PhonePoint < 5){
            PhoneView.image = phonefirst;
            NSLog(@"%@", @"first");
            BackgroundView.image = phonebackfirst;
        }
        if(PhonePoint >= 5 && PhonePoint < 20){
            PhoneView.image = phonesecond;
            NSLog(@"%@", @"second");
            BackgroundView.image = phonebacksecond;
        }
        if(PhonePoint >= 20){
            PhoneView.image = phonethird;
            NSLog(@"%@", @"third");
            BackgroundView.image = phonebackthird;
        }
        
        if(PhonePoint < 1 || (5 <= PhonePoint && PhonePoint < 8)){
            Phonegage.image = phonegage0;
        }else if((1 <= PhonePoint && PhonePoint < 2) || (8 <= PhonePoint && PhonePoint < 11)){
            Phonegage.image = phonegage1;
        }else if((2 <= PhonePoint && PhonePoint < 3) || (11 <= PhonePoint && PhonePoint < 14)){
            Phonegage.image = phonegage2;
        }else if((3 <= PhonePoint && PhonePoint < 4) || (14 <= PhonePoint && PhonePoint < 17)){
            Phonegage.image = phonegage3;
        }else if((4 <= PhonePoint && PhonePoint < 5) || (17 <= PhonePoint && PhonePoint < 20)){
            Phonegage.image = phonegage4;
        }else if(PhonePoint >= 20){
            Phonegage.image = phonegage5;
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

//    NSUserDefaults *dic = [NSUserDefaults standardUserDefaults];
//    int heart = [dic integerForKey:@"heart"];
//
//    heart++;
//
//    [dic setInteger:heart forKey:@"heart"];
//
//    [dic synchronize];
