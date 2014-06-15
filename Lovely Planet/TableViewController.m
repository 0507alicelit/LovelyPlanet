//
//  TableViewController.m
//  Lovely Planet
//
//  Created by ありす on 2014/03/31.
//  Copyright (c) 2014年 ありす. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

#pragma mark - ViewCycle
-(void)viewDidLoad{
    Tablefirst = [UIImage imageNamed:@"table1.png"];
    Tablesecond = [UIImage imageNamed:@"table2.png"];
    Tablethird = [UIImage imageNamed:@"table3.png"];
    Tablebackfirst = [UIImage imageNamed:@"tableback1.png"];
    Tablebacksecond = [UIImage imageNamed:@"tableback2.png"];
    Tablebackthird = [UIImage imageNamed:@"tableback3.png"];
    tablegage0 = [UIImage imageNamed:@"tablegage0.png"];
    tablegage1 = [UIImage imageNamed:@"tablegage1.png"];
    tablegage2 = [UIImage imageNamed:@"tablegage2.png"];
    tablegage3 = [UIImage imageNamed:@"tablegage3.png"];
    tablegage4 = [UIImage imageNamed:@"tablegage4.png"];
    tablegage5 = [UIImage imageNamed:@"tablegage5.png"];
    
    NSLog(@"Tablepoint = %d", TablePoint);
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = (int)[pointUd integerForKey:@"point"];//読み込み2
    
    NSUserDefaults *tableUd = [NSUserDefaults standardUserDefaults];//読み込み1
    TablePoint = (int)[tableUd integerForKey:@"Table"];//読み込み2
    
    TableLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
    
    if(TablePoint < 25){
        TableView.image = Tablefirst;
        NSLog(@"%@", @"first");
        BackgroundView.image = Tablebackfirst;
    }
    if(TablePoint >= 25 && TablePoint < 75){
        TableView.image = Tablesecond;
        NSLog(@"%@", @"second");
        BackgroundView.image = Tablebacksecond;
    }
    if(TablePoint >= 75){
        TableView.image = Tablethird;
        NSLog(@"%@", @"third");
        BackgroundView.image = Tablebackthird;
    }
    
    if(TablePoint < 5 || (45 <= TablePoint && TablePoint <= 55)){
        tablegage.image = tablegage0;
    }else if((5 <= TablePoint && TablePoint < 10) || (25 <= TablePoint && TablePoint < 35)){
        tablegage.image = tablegage1;
    }else if((10 <= TablePoint && TablePoint < 15) || (35 <= TablePoint && TablePoint < 45)){
        tablegage.image = tablegage2;
    }else if((15 <= TablePoint && TablePoint < 20) || (45 <= TablePoint && TablePoint < 55)){
        tablegage.image = tablegage3;
    }else if((20 <= TablePoint && TablePoint < 25) || (55 <= TablePoint && TablePoint < 65)){
        tablegage.image = tablegage4;
    }else if(TablePoint >= 65){
        tablegage.image = tablegage5;
    }
}

-(IBAction)pour{
    if(heartpoint > 0 && TablePoint < 65){
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint--;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSUserDefaults *TableUd = [NSUserDefaults standardUserDefaults];//設定1
        TablePoint = (int)[TableUd integerForKey:@"Table"];//設定2
        TablePoint++;
        [TableUd setInteger:TablePoint forKey:@"Table"];//設定3
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if(TablePoint < 25){
            TableView.image = Tablefirst;
            NSLog(@"%@", @"first");
            BackgroundView.image = Tablebackfirst;
        }
        if(TablePoint >= 25 && TablePoint < 75){
            TableView.image = Tablesecond;
            NSLog(@"%@", @"second");
            BackgroundView.image = Tablebacksecond;
        }
        if(TablePoint >= 75){
            TableView.image = Tablethird;
            NSLog(@"%@", @"third");
            BackgroundView.image = Tablebackthird;
        }
        
        if(TablePoint < 5 || (45 <= TablePoint && TablePoint <= 55)){
            tablegage.image = tablegage0;
        }else if((5 <= TablePoint && TablePoint < 10) || (25 <= TablePoint && TablePoint < 35)){
            tablegage.image = tablegage1;
        }else if((10 <= TablePoint && TablePoint < 15) || (35 <= TablePoint && TablePoint < 45)){
            tablegage.image = tablegage2;
        }else if((15 <= TablePoint && TablePoint < 20) || (45 <= TablePoint && TablePoint < 55)){
            tablegage.image = tablegage3;
        }else if((20 <= TablePoint && TablePoint < 25) || (55 <= TablePoint && TablePoint < 65)){
            tablegage.image = tablegage4;
        }else if(TablePoint >= 65){
            tablegage.image = tablegage5;
            if(alertOff == 0){
                alertOff++;
                UIAlertView *alert =
                [[UIAlertView alloc]
                 initWithTitle:@""
                 message:@"クリアー！"
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
    
    TableLabel.text = [NSString stringWithFormat:@"%d",heartpoint];
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
