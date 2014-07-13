//
//  ViewController.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/09.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/*
ありさ愛してるようふふ
えへへおほほ
てへぺろー
*/

@end

@implementation ViewController{
    int index;
}

@synthesize heartImageArray = _heartImageArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // タッチを有効にする
    self.view.userInteractionEnabled = YES;
    
    count=0;
    //タイマーを開始する
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(makeAndMoveHeart) userInfo:nil repeats:YES]; //ハート生成
    UIImage *heart1 = [UIImage imageNamed:@"heart1.png"];
    UIImage *heart2 = [UIImage imageNamed:@"heart2.png"];//ハート画像
    
    heartArray = [NSMutableArray arrayWithObjects:heart1, heart2, nil];//イメージArray
    heartBtnArray = NSMutableArray.new;//ボタンに入れてる
    
    [label blink];
    
}

-(IBAction)start{
    UIStoryboard *storyboad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *NextViewController = [storyboad instantiateViewControllerWithIdentifier:@"StageSelect"];
    [self presentViewController:NextViewController animated:YES completion:nil];
}

- (void)makeAndMoveHeart
{
    
    if (count%100==0) {
        
        //新しく♡をつくる
        int random = arc4random()%10-5;
        index = random;
        heart = [UIButton buttonWithType:UIButtonTypeRoundedRect];//大きさ設定
        heart.frame = CGRectMake(rand()%321,-10,100,100); // 大きさ設定
        heart.tag   = index;   // タグ付け
        [heart setBackgroundImage:[UIImage imageNamed:@"heart1.png"] forState:UIControlStateNormal]; // 表示内容
        [heart addTarget:self action:@selector(destroy:) forControlEvents:UIControlEventTouchDown];//消す
        heart.userInteractionEnabled = YES;
        
        [heartBtnArray addObject:heart];//ボタンに背景入れる
        [self.view addSubview:heart];//表示
    }
    count++;

    
    [self MoveHeart];
}

- (void)moveHeart:(UIButton *)btn{
    
    
}

- (void)destroy:(UIButton *)btn
{
    [btn removeFromSuperview];//消す
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // シングルタッチの場合
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //NSLog(@"x:%f y:%f", location.x, location.y);
    CGRect rect = CGRectMake(location.x, location.y, 3, 3);
    for( UIButton *h in heartBtnArray){
        
        //ボタンと指が重なり合ったか判定
        if (CGRectIntersectsRect(rect, h.frame)) {
            [self destroy:h];

            
        }
    }
    NSLog(@"x:%f y:%f", location.x, location.y);
}

-(void)MoveHeart{
    for( UIButton *h in heartBtnArray)
    {
        
        //NSLog(@"%d",h.tag);
        h.frame = CGRectMake(h.frame.origin.x+h.tag/50.0, h.frame.origin.y + 0.7,80,80);
        
        if(hanten%10==0)
        {
            pata++;
            int y=h.frame.origin.y;
            
            if(y%2==0)
            {
                UIImage *heart1 = [UIImage imageNamed:@"heart1.png"];
                [h setBackgroundImage:heart1 forState:UIControlStateNormal];
            }else
            {
                
                UIImage *heart2 = [UIImage imageNamed:@"heart2.png"];
                [h setBackgroundImage:heart2 forState:UIControlStateNormal];
            }
        }

        //NSLog(@"yeah");
        
    }
    hanten++;
}

//-(IBAction)next{
//    StageSelectViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//}

-(IBAction)reset{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}


@end


















