//
//  TNNMessageBody.m
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/11/27.
//  Copyright © 2015年 思源集团. All rights reserved.
//

#import "TNNMessageBody.h"
#import "TNTextData.h"
#import "TNTextConfig.h"

@interface TNNMessageBody()<TNTextDataDelegate>

@end

@implementation TNNMessageBody

- (TNTextData *)textData
{
    if (!_textData)
    {
        _textData = [[TNTextData alloc] init];
        _textData.delegate = self;
        [_textData ctFrame];
    }
    return _textData;
}


#pragma mark - TNTextDataDelegate
- (NSMutableAttributedString *)textData:(TNTextData *)textData attributes:(NSDictionary *)attribute
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.content attributes:attribute];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[(id)kCTForegroundColorAttributeName] = (id)[UIColor blackColor].CGColor;
    [attributedString addAttributes:dictionary range:NSMakeRange(0, 3)];
    //添加解析
    
//    CTRunDelegateCallbacks callbacks;
//    memset(&callbacks, 0, sizeof(CTRunDelegateCallbacks));
//    callbacks.version = kCTRunDelegateVersion1;
//    callbacks.getAscent = ascentCallback;
//    callbacks.getDescent = descentCallback;
//    callbacks.getWidth = widthCallback;
//    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, (__bridge void *)(dict));
//    
//    // 使用 0xFFFC 作为空白的占位符
//    unichar objectReplacementChar = 0xFFFC;
//    
//    NSString * content = [NSString stringWithCharacters:&objectReplacementChar length:1];
//    NSDictionary * attributes = [self attributesWithConfig:config];
//    NSMutableAttributedString * space =
//    [[NSMutableAttributedString alloc] initWithString:content
//                                           attributes:attributes];
//    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)space,
//                                   CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);
//    CFRelease(delegate);

    
//    NSString *imageName = @"haha.png";
//    NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[[UIImage imageNamed:imageName] TIFFRepresentation]];
//    imageFileWrapper.filename = imageName;
//    imageFileWrapper.preferredFilename = imageName;
    
//    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc]
//    NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
//    [attributedString insertAttributedString:imageAttributedString atIndex:1];
    return attributedString;
}

static CGFloat ascentCallback(void *ref){
    return [(NSNumber*)[(__bridge NSDictionary*)ref objectForKey:@"height"] floatValue];
}

static CGFloat descentCallback(void *ref){
    return 0;
}

static CGFloat widthCallback(void* ref){
    return [(NSNumber*)[(__bridge NSDictionary*)ref objectForKey:@"width"] floatValue];
}

- (TNTextConfig *)getTextConfig
{
    TNTextConfig *textConfig = [[TNTextConfig alloc] init];
    textConfig.font = [UIFont systemFontOfSize:14];
    textConfig.textColor = [UIColor redColor];
    textConfig.lineSpace = 1.5f;
    textConfig.preferredMaxLayoutWidth = 320.f;
    return textConfig;
}

- (NSInteger)textLenght
{
    return self.content.length;
}

- (CGSize)messageContentSize
{
    return self.textData.size;
}

@end
