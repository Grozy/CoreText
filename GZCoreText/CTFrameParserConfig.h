//
//  CTFrameParserConfig.h
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/9/1.
//  Copyright (c) 2015年 思源集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat fontSize;

@property (nonatomic, assign) CGFloat lineSpace;

@property (nonatomic, strong) UIColor *textColor;

@end
