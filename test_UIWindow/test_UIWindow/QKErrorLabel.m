//
//  QKErrorLabel.m
//  BRDCobraCRM
//
//  Created by Jingnan Zhang on 15/12/8.
//  Copyright © 2015年 Sulei Qin. All rights reserved.
//

#import "QKErrorLabel.h"
static NSInteger height = 18;
@interface QKErrorLabel (){
    NSInteger count; //防止，不停的点击，造成累计上移/下移
}

@end
@implementation QKErrorLabel



-(instancetype)init{  
    self = [super init];
    if (self) {
        [self beginInit];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self beginInit];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self beginInit];
    }
    return self;
}
-(void)beginInit{
    
    self.font = [UIFont systemFontOfSize:12.0f];
    self.backgroundColor = [UIColor orangeColor];
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    
}

-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.font = self.titleFont;
}
-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.textColor = self.titleColor;
}
-(void)setErrorMessage:(NSString *)errorMessage{
    _errorMessage = errorMessage;
    self.text = self.errorMessage;

    __weak QKErrorLabel *wself = self;
    if (self.hidden) {
        self.hidden = NO;
    }
    if (count == 0) {
        //执行动画, 改变Y值  没用
        [UIView animateWithDuration:0.6 animations:^{
//            [UIApplication sharedApplication].statusBarHidden = YES;
            wself.transform = CGAffineTransformMakeTranslation(0, height);
            count = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.6 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
                wself.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                 count = 0;
                [self dismiss];
//                [UIApplication sharedApplication].statusBarHidden = NO;

            }];
            
        }];
        
    }
    
}

-(void)setBackGroundColor:(UIColor *)backGroundColor{
    _backGroundColor = backGroundColor;
    self.backgroundColor = self.backGroundColor;
}

/**
 *  当 次label的上面无view遮盖时，需在最后移除
 */
-(void)dismiss{
//    [self removeFromSuperview];
    self.hidden = YES;
}
@end
