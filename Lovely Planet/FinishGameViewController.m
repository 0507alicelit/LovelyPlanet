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
    [self presentViewController:gameStartVC animated:YES completion:nil];}

-(IBAction)finish{
    StageSelectViewController *stageSelectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"StageSelect"];
    [self presentViewController:stageSelectVC animated:YES completion:nil];
}

- (IBAction)twitterShare{
    
    // Twitterアカウントが端末に設定されているか？
    if ( ! [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        return;
    }
    
    // 設定されてるアカウントを取得(マルチアカウントってな)
    ACAccountStore *accountStore = [ACAccountStore new];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType
                                          options:nil
                                       completion:^(BOOL granted, NSError *error) {
                                           
                                           if ( ! granted) {
                                               return;
                                           }
                                           
                                           self.accounts = [accountStore accountsWithAccountType:accountType];
                                       }];
    
}

// アカウント選択後
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    
    // 投稿するGIF
    NSURL *gifUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mikumiku" ofType:@"gif"]];
    NSData *gifData = [NSData dataWithContentsOfURL: gifUrl];
    
    // 投稿処理へ
    ACAccount *account = [self.accounts objectAtIndex:buttonIndex];
    
    // twitter api
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update_with_media.json"];
    NSDictionary *params = @{@"status" : @"%d点でした！「Lovely Planet」#らぶぷら",nowHeartPoint};  // めっせーじ
    // request の作成
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodPOST
                                                      URL:url
                                               parameters:params];
    
    [request setAccount:account];       // 投稿アカウントの指定
    [request addMultipartData:gifData withName:@"media[]" type:@"image/gif" filename:@"image.gif"]; //マルチパートの設定
    
    // リクエスト投げる
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSLog(@"response : %@", [urlResponse debugDescription]);
    }];
    
}


@end
