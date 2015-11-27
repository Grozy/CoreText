//
//  TNNMessageBody.h
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/11/27.
//  Copyright © 2015年 思源集团. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TNTextData.h"

@interface TNNMessageBody : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) TNTextData *textData;

- (CGSize)messageContentSize;

@end
