//
//  ViewController.h
//  MemoBook
//
//  Created by システム管理者 on 13/05/23.
//  Copyright (c) 2013年 koji.Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExTextView.h"
#import "UIPlaceHolderTextView.h"
@interface ViewController : UIViewController<UITextViewDelegate,UIScrollViewDelegate>{
    
}
@property (nonatomic,strong) IBOutlet UIPlaceHolderTextView *textView;
@property (nonatomic,strong) UIImageView *bgView;

@end
