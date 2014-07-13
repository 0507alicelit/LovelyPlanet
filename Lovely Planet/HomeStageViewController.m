//
//  HomeStageViewController.m
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import "HomeStageViewController.h"

@implementation HomeStageViewController

-(void)viewDidLoad{
    Homefirst = [UIImage imageNamed:@"home1.png"];
    Homesecond = [UIImage imageNamed:@"home2.png"];
    Homethird = [UIImage imageNamed:@"home3.png"];
    Homebackfirst = [UIImage imageNamed:@"homeback1.png"];
    Homebacksecond = [UIImage imageNamed:@"homeback2.png"];
    Homebackthird = [UIImage imageNamed:@"homeback3.png"];
    homegage0 = [UIImage imageNamed:@"homegage0.png"];
    homegage1 = [UIImage imageNamed:@"homegage1.png"];
    homegage2 = [UIImage imageNamed:@"homegage2.png"];
    homegage3 = [UIImage imageNamed:@"homegage3.png"];
    homegage4 = [UIImage imageNamed:@"homegage4.png"];
    homegage5 = [UIImage imageNamed:@"homegage5.png"];
    
    NSLog(@"homePoint = %d", homePoint);
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = (int)[pointUd integerForKey:@"point"];//読み込み2
    
    NSUserDefaults *HomeUd = [NSUserDefaults standardUserDefaults];//読み込み1
    homePoint = (int)[HomeUd integerForKey:@"Home"];//読み込み2
    
    HomeLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
    
    if(homePoint < 350){
        HomeView.image = Homefirst;
        NSLog(@"%@", @"first");
        BackgroundView.image = Homebackfirst;
    }
    if(homePoint >= 350 && homePoint < 850){
        HomeView.image = Homesecond;
        NSLog(@"%@", @"second");
        BackgroundView.image = Homebacksecond;
    }
    if(homePoint >= 850){
        HomeView.image = Homethird;
        NSLog(@"%@", @"third");
        BackgroundView.image = Homebackthird;
    }
    
    if(homePoint < 70 || (350 <= homePoint && homePoint <= 450)){
        homegage.image = homegage0;
    }else if((70 <= homePoint && homePoint < 140) || (450 <= homePoint && homePoint < 550)){
        homegage.image = homegage1;
    }else if((140 <= homePoint && homePoint < 210) || (550 <= homePoint && homePoint < 650)){
        homegage.image = homegage2;
    }else if((210 <= homePoint && homePoint < 280) || (650 <= homePoint && homePoint < 750)){
        homegage.image = homegage3;
    }else if((280 <= homePoint && homePoint < 350) || (750 <= homePoint && homePoint < 850)){
        homegage.image = homegage4;
    }else if(homePoint >= 850){
        homegage.image = homegage5;
    }
}

-(IBAction)pour{
    if(heartpoint>0 && homePoint < 850){
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint--;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSUserDefaults *HomeUd = [NSUserDefaults standardUserDefaults];//設定1
        homePoint = (int)[HomeUd integerForKey:@"Home"];//設定2
        homePoint++;
        [HomeUd setInteger:homePoint forKey:@"Home"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        HomeLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
        
        if(homePoint < 350){
            HomeView.image = Homefirst;
            NSLog(@"%@", @"first");
            BackgroundView.image = Homebackfirst;
        }
        if(homePoint >= 350 && homePoint < 850){
            HomeView.image = Homesecond;
            NSLog(@"%@", @"second");
            BackgroundView.image = Homebacksecond;
        }
        if(homePoint >= 850){
            HomeView.image = Homethird;
            NSLog(@"%@", @"third");
            BackgroundView.image = Homebackthird;
        }
        
        if(homePoint < 70 || (350 <= homePoint && homePoint <= 450)){
            homegage.image = homegage0;
        }else if((70 <= homePoint && homePoint < 140) || (450 <= homePoint && homePoint < 550)){
            homegage.image = homegage1;
        }else if((140 <= homePoint && homePoint < 210) || (550 <= homePoint && homePoint < 650)){
            homegage.image = homegage2;
        }else if((210 <= homePoint && homePoint < 280) || (650 <= homePoint && homePoint < 750)){
            homegage.image = homegage3;
        }else if((280 <= homePoint && homePoint < 350) || (750 <= homePoint && homePoint < 850)){
            homegage.image = homegage4;
        }else if(homePoint >= 850){
            homegage.image = homegage5;
            if(alertOff == 0){
                alertOff++;
                UIAlertView *alert =
                [[UIAlertView alloc]
                 initWithTitle:@""
                 message:@"全ステージクリアー！\nおめでとう！！"
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
