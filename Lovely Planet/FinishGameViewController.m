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
    [self presentViewController:gameStartVC animated:YES completion:nil];
}

-(IBAction)finish{
    StageSelectViewController *stageSelectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"StageSelect"];
    [self presentViewController:stageSelectVC animated:YES completion:nil];
}

-(IBAction)twitterShare{
    //コメント、写真、URLを投稿する。
    //メソッドの引数(serveceType）で、どこのサービスに投稿するか認識。
    
    NSString *setText = [NSString stringWithFormat:@"%d点でした！！ #LovelyPlanet",nowHeartPoint];   //コメント欄に文字を表示
    
    //投稿用画面のインスタンスを作成
    SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [composeController setInitialText:setText]; //コメントのセット
    
    //投稿が完了したかの確認
    [composeController setCompletionHandler:^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            // キャンセルした場合
            NSLog(@"キャンセルしました");
        } else if (result == SLComposeViewControllerResultDone) {
            // 投稿に成功した場合
            NSLog(@"投稿しました");
        }
    }];
    
    [self presentViewController:composeController animated:YES completion:nil];
    
}


@end
