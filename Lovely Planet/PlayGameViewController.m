//
//  PlayGameViewContoroller.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "PlayGameViewController.h"

@implementation PlayGameViewController


-(void)viewDidLoad{
    count=0;
    piyotime = 0.0;//時間のリセット
    yoko=0;
    piyokasoku=0.9;
    heartpoint=0;
    piyohantei.text = @"";

    piyotimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(up) userInfo:Nil repeats:YES];//タイマー
    
    piyoblue = [UIImage imageNamed:@"piyoblue.png"];
    piyogray = [UIImage imageNamed:@"piyogray.png"];
    piyoorange = [UIImage imageNamed:@"piyoorange.png"];
    piyopink = [UIImage imageNamed:@"piyopink.png"];
    piyoyellow = [UIImage imageNamed:@"piyoyellow.png"];
    piyobluepa = [UIImage imageNamed:@"piyobluepa.png"];
    piyograypa = [UIImage imageNamed:@"piyograypa.png"];
    piyoorangepa = [UIImage imageNamed:@"piyoorangepa.png"];
    piyopinkpa = [UIImage imageNamed:@"piyopinkpa.png"];
    piyoyellowpa = [UIImage imageNamed:@"piyoyellowpa.png"];
    
    piyoArray = [NSMutableArray array];

    /* -- スピード (5.0を大きくすれば遅くなる) -- */
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    piyoSpeed = appFrame.size.width / 5.0;
    
    NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//読み込み1
    heartpoint = (int)[pointUd integerForKey:@"point"];//読み込み2
    
    //増原
    div = 140;
}




-(void)up{//ぴよ速くする
    piyotime += 0.01;
    count++;
    piyotimelabel.text = [NSString stringWithFormat:@"%.2f",piyotime];//時間表示
    if (count == 140) {
        [self makepiyo];//1つめのpiyoを作る
    }
    if (count > 140) {
        [self movepiyo];//1つめのpiyoが作られてからmovipiyoをする
    }
    
}




//[[NSUserDefaults standardUserDefaults] synchronize];

- (void)makepiyo{//ぴよ作る
    NSLog(@"makepiyo");
    /* 新しくぴよをつくる */
    piyocolor = random()%5;
    
    //NSLog(@"yoko is %f", yoko);
    
    /* -- 色の設定 -- */
    switch (piyocolor) {
        case 0:
            piyoview=[[UIImageView alloc] initWithImage:piyoblue];
            break;
        case 1:
            piyoview=[[UIImageView alloc] initWithImage:piyogray];
            break;
        case 2:
            piyoview=[[UIImageView alloc] initWithImage:piyoorange];
            break;
        case 3:
            piyoview=[[UIImageView alloc] initWithImage:piyopink];
            break;
        case 4:
            piyoview=[[UIImageView alloc] initWithImage:piyoyellow];
            break;
        default:
            break;
    }
    piyoview.tag = piyocolor;
    piyoview.frame = CGRectMake(-90, 20, 90, 90); // 大きさ設定
    [self.view addSubview:piyoview];//表示
    [piyoArray addObject:piyoview];

    
    
    int index = piyoCount - 1;
    NSLog(@"index %d",index);
    
    piyoCount++;
    
#pragma mark - 5ポイントごとに加速
    if (point%5 == 0) {
        piyokasoku = piyokasoku + 0.2;
    }
    //piyokasoku += 0.08;
}


-(void)movepiyo{//ぴよ動かす
    NSLog(@"piyoCount is %d", piyoCount);
    
    for(UIImageView *iv in piyoArray){
#pragma mark - 座標と加速を足す
        float x = piyokasoku + iv.frame.origin.x;
        iv.frame = CGRectMake(x,20, 90, 90);//移動
    }
    
    UIImageView *piyoImage = [piyoArray objectAtIndex:piyoCount-1];
    if (piyoImage.frame.origin.x > 50) {
        NSLog(@"makePiyo");
        [self makepiyo];
    }
    
    UIImageView *firstPiyo = [piyoArray objectAtIndex:0];
    if(firstPiyo.frame.origin.x > 320) {
        NSLog(@"MISS!!!");
        piyohantei.text = [NSString stringWithFormat:@"MISS!"];//ViewControllerのインスタンス生成
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint = heartpoint + point;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [pointUd synchronize];
        NSLog(@"%d heart",heartpoint);
        NSLog(@"%d point",point);
        FinishGameViewController *finishGameStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FinishGame"];
        [self presentViewController:finishGameStageVC animated:YES completion:nil];
        [piyotimer invalidate];
    }
}





-(IBAction)eggYellow{
    [self hit:4];
}

-(IBAction)eggOrange{
    [self hit:2];
}

-(IBAction)eggBlue{
    [self hit:0];

}

-(IBAction)eggGlay{
    [self hit:1];

}

-(IBAction)eggPink{
    [self hit:3];

}



-(void)hit:(int)color{//ヒット判定
    if(piyoArray.count == 0){NSLog(@"MISS!!!");
        piyohantei.text = [NSString stringWithFormat:@"MISS!"];//ViewControllerのインスタンス生成
        NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
        heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
        heartpoint = heartpoint + point;
        [pointUd setInteger:heartpoint forKey:@"point"];//設定3
        [pointUd synchronize];
        NSLog(@"%d heart",heartpoint);
        NSLog(@"%d point",point);
        FinishGameViewController *finishGameStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FinishGame"];
        [self presentViewController:finishGameStageVC animated:YES completion:nil];
        [piyotimer invalidate];
    }else{
        UIImageView *iv=[piyoArray objectAtIndex:0];
        int piyox = iv.frame.origin.x;
        int hitx = 250;
        int hantei = piyox-hitx;
        
        if (abs(hantei)<50 && color==iv.tag) {
            NSLog(@"GREAT!!!");
            piyohantei.text = [NSString stringWithFormat:@"GREAT!"];
            [self destroy];
            [piyoArray removeObject:iv];
            [iv removeFromSuperview];
            point++;
            Pointlabel.text = [NSString stringWithFormat:@"%d点",point];
        }else if (abs(hantei)<=80 && color==iv.tag) {
            NSLog(@"GOOD!!!");
            piyohantei.text = [NSString stringWithFormat:@"GOOD!"];
            [self destroy];
            [piyoArray removeObject:iv];
            [iv removeFromSuperview];
            point++;
            Pointlabel.text = [NSString stringWithFormat:@"%d点",point];
            
        }else{
            NSLog(@"MISS!!!");
            piyohantei.text = [NSString stringWithFormat:@"MISS!"];//ViewControllerのインスタンス生成
            NSUserDefaults *pointUd = [NSUserDefaults standardUserDefaults];//設定1
            heartpoint = (int)[pointUd integerForKey:@"point"];//設定2
            heartpoint = heartpoint + point;
            [pointUd setInteger:heartpoint forKey:@"point"];//設定3
            [pointUd synchronize];
            NSLog(@"%d heart",heartpoint);
            NSLog(@"%d point",point);
            FinishGameViewController *finishGameStageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FinishGame"];
            [self presentViewController:finishGameStageVC animated:YES completion:nil];
            [piyotimer invalidate];
        }
    }
    
    piyoCount--;
}

-(void)destroy{//ぴよ消す
    switch (piyocolor) {
        case 0:
            piyoview=[[UIImageView alloc] initWithImage:piyobluepa];
            //point=point+1;
            break;
        case 1:
            piyoview=[[UIImageView alloc] initWithImage:piyograypa];
            break;
        case 2:
            piyoview=[[UIImageView alloc] initWithImage:piyoorangepa];
            break;
        case 3:
            piyoview=[[UIImageView alloc] initWithImage:piyopinkpa];
            break;
        case 4:
            piyoview=[[UIImageView alloc] initWithImage:piyoyellowpa];
            break;
        default:
            break;
    }
}









@end
