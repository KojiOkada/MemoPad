//
//  AppDelegate.h
//  MemoBook
//
//  Created by システム管理者 on 13/05/23.
//  Copyright (c) 2013年 koji.Okada. All rights reserved.
//
//パターンを途中で変更する方法について調べる
//キーボードがキャレットを隠さない場合はcontentOffsetしない
#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
