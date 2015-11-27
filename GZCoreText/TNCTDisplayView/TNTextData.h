//
//  TNTextData.h
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/11/27.
//  Copyright © 2015年 思源集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@class TNTextData;
@class TNTextConfig;

@protocol TNTextDataDelegate <NSObject>

@required

- (NSMutableAttributedString *)textData:(TNTextData*)textData attributes:(NSDictionary *)attribute;

- (TNTextConfig *)getTextConfig;

@end

@interface TNTextData : NSObject

@property (nonatomic, weak) id<TNTextDataDelegate> delegate;

@property (nonatomic, readonly) CGSize size;

@property (nonatomic, readonly) CTFrameRef ctFrame;

- (void)prepareForReuse;

@end
