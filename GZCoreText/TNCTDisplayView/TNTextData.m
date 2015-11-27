//
//  TNTextData.m
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/11/27.
//  Copyright © 2015年 思源集团. All rights reserved.
//

#import "TNTextData.h"
#import "TNTextConfig.h"

@interface TNTextData()

@property (nonatomic, readwrite) CTFrameRef ctFrame;

@property (nonatomic, readwrite) CGSize size;

@end

@implementation TNTextData

- (void)dealloc
{
    if (self.ctFrame)
    {
        CFRelease(self.ctFrame);
    }
}

- (void)prepareForReuse
{
    CFRelease(self.ctFrame);
    self.ctFrame = [self createCTFrameRef];
}

- (CTFrameRef)ctFrame
{
    if (!_ctFrame)
    {
       _ctFrame = [self createCTFrameRef];
    }
    return _ctFrame;
}

- (CTFrameRef)createCTFrameRef
{
    TNTextConfig *textConfig = [self.delegate getTextConfig];
    if (!textConfig)
        return nil;
    NSMutableAttributedString *attributeString = [self.delegate textData:self attributes:[self attributesWithConfig:textConfig]];
    if (!attributeString)
        return nil;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeString);
    
    // 获得要绘制的区域的高度
    CGSize restrictSize = CGSizeMake(textConfig.preferredMaxLayoutWidth, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0,0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    // 生成 CTFrameRef 实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:textConfig height:textHeight];
    
    // 将生成好的 CTFrameRef 实例和计算好的绘制高度保存到 CoreTextData 实例中，最后返回 CoreTextData 实例
    self.size = CGSizeMake(textConfig.preferredMaxLayoutWidth, textHeight);
    
    // 释放内存
    CFRelease(framesetter);
    return frame;
}

- (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter
                                  config:(TNTextConfig *)config
                                  height:(CGFloat)height {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.preferredMaxLayoutWidth, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}

- (NSDictionary *)attributesWithConfig:(TNTextConfig *)config {
    CGFloat fontSize = config.font.lineHeight;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        { kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpacing }
    };
    
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    
    UIColor * textColor = config.textColor;
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    return dict;
}
@end
