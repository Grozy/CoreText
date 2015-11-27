//
//  TNTextConfig.h
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/11/27.
//  Copyright © 2015年 思源集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TNTextConfig : NSObject

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic) CGFloat lineSpace;

@property (nonatomic) CGFloat preferredMaxLayoutWidth;

@end
