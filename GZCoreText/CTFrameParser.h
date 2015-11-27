//
//  CTFrameParser.h
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/9/1.
//  Copyright (c) 2015年 思源集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"

@class CTFrameParserConfig;

@interface CTFrameParser : NSObject

+ (NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;

+ (CoreTextData *)parseAttributeContent:(NSAttributedString *)contentString config:(CTFrameParserConfig *)config;
@end
