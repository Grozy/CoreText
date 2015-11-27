//
//  CTFrameParserConfig.m
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/9/1.
//  Copyright (c) 2015年 思源集团. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (instancetype)init
{
    if (self = [super init])
    {
        self.width = 100.f;
        self.fontSize = 20.f;
        self.lineSpace = 8.f;
        self.textColor = [UIColor colorWithRed:108.f/255.f green:108.f/255.f blue:108.f/255.f alpha:1];
    }
    return self;
}

@end
