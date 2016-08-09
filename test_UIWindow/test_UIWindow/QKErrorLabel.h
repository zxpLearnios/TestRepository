//
//  QKErrorLabel.h
//  BRDCobraCRM
//
//  Created by Jingnan Zhang on 15/12/8.
//  Copyright © 2015年 Sulei Qin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QKErrorLabel : UILabel
/** 字体大小 */
@property (nonatomic, assign) UIFont *titleFont;
/** 错误信息 */
@property (nonatomic, copy) NSString *errorMessage;
/** 字体颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 背景色 */
@property (nonatomic, strong) UIColor *backGroundColor;


@end
