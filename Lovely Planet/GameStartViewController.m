//
//  GameStartViewController.m
//  Lovely Planet
//
//  Created by ありす on 2013/10/16.
//  Copyright (c) 2013年 ありす. All rights reserved.
//

#import "GameStartViewController.h"

@implementation GameStartViewController

-(IBAction)start{
    UIStoryboard *storyboad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *PlayGameViewController = [storyboad instantiateViewControllerWithIdentifier:@"PlayGame"];
    [self presentViewController:PlayGameViewController animated:YES completion:nil];
}
-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
