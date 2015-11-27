//
//  CoreTextData.m
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/9/1.
//  Copyright (c) 2015年 思源集团. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData

- (void)setCtFrame:(CTFrameRef)ctFrame
{
    if (_ctFrame != ctFrame)
    {
        if (_ctFrame != nil)
        {
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)dealloc
{
    if (!_ctFrame)
    {
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}

@end
