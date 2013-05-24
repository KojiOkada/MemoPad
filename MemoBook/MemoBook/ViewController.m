//
//  ViewController.m
//  MemoBook
//
//  Created by システム管理者 on 13/05/23.
//  Copyright (c) 2013年 koji.Okada. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    _textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"memo2.png"]];
	// Do any additional setup after loading the view, typically from a nib.
//    _textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 18)];
//    view.text = @"2013/5/21 09:00";
//    view.backgroundColor = [UIColor grayColor];


    _bgView = [[UIImageView alloc]initWithFrame:_textView.bounds];
    _bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"memo2.png"]];
    [_textView addSubview: _bgView];
    [_textView sendSubviewToBack: _bgView];
 
	[_textView setPlaceholder:@"Input stringsssssssssssssss"];
	[_textView setPlaceholderTextColor:[UIColor redColor]];
    [_textView setText:@""];
    // ピクセル
//    CGSize textSize = [_textView.text sizeWithFont:_textView.font
//                                constrainedToSize:CGSizeMake(320, 1000)
//                                    lineBreakMode:UILineBreakModeCharacterWrap];
    CGSize textSize = [_textView.text sizeWithFont:_textView.font constrainedToSize:CGSizeMake(320, 1000)];
    NSLog(@"textSize font:%@ w:%f h:%f", _textView.font, textSize.width, textSize.height);
    // textSize font: font-family: "Helvetica"; font-weight: normal; font-style: normal; font-size: 12px w:39.000000 h:15.000000
}
-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center;
    center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(keyboardWillShow:)
                   name:UIKeyboardWillShowNotification
                 object:nil];
    [center addObserver:self
               selector:@selector(keybaordWillHide:)
                   name:UIKeyboardWillHideNotification
                 object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    NSNotificationCenter *center;
    center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self
                      name:UIKeyboardWillShowNotification
                    object:nil];
    [center removeObserver:self
                      name:UIKeyboardWillHideNotification
                    object:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView{

    [_bgView setFrame:CGRectMake(0, 0, 320, _textView.contentSize.height)];
    _bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"memo2.png"]];
    NSRange range = _textView.selectedRange;
    
    DebugLog(@"%@",NSStringFromRange(range))
}
-(IBAction)doneDidPush:(id)sender{
    [_textView resignFirstResponder];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_bgView setFrame:CGRectMake(0, 0, 320, scrollView.contentSize.height)];
    _bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"memo2.png"]];
}
- (void)keyboardWillShow:(NSNotification*)notification{

    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[self.view superview] convertRect:keyboardRect fromView:nil];
    
    //キーボードのanimationDurationを取得
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //メインビューの高さをキーボードの高さ分マイナスしたframe
    CGRect frame = _textView.frame;
    frame.size.height -= keyboardRect.size.height;
    
    //キーボードアニメーションと同じ間隔でメインビューの高さをアニメーションしつつ変更する。
    //これでUITextViewも追従して高さが変わる。
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _textView.frame = frame;
    [_bgView setFrame:CGRectMake(0, 0, 320, _textView.contentSize.height)];
    _bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"memo2.png"]];
    [UIView commitAnimations];
}
- (void)keybaordWillHide:(NSNotification*)notification{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[self.view superview] convertRect:keyboardRect fromView:nil];
    
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect frame = _textView.frame;
    frame.size.height += keyboardRect.size.height;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _textView.frame = frame;
    [UIView commitAnimations];

}

@end
