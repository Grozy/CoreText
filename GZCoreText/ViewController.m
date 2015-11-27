//
//  ViewController.m
//  GZCoreText
//
//  Created by syswin-sungzuozhi on 15/9/1.
//  Copyright (c) 2015年 思源集团. All rights reserved.
//

#import "ViewController.h"
#import "CTFrameParserConfig.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"
#import "CTDisplayView.h"
#import "TNNMessageBody.h"
#import "TNTextData.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CTDisplayView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
////    config.width = self.ctView.frame.size.width;
//    config.textColor = [UIColor blackColor];
//    
//    NSString *content =
//    @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
//    " 换为 CoreTextData 的方法。"
//    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
//    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
//    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
//    " 示成黑色，那么就办不到了。"
//    "\n\n"
//    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
//    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
//    " 我们想要的信息。";
//    NSDictionary *attr = [CTFrameParser attributesWithConfig:config];
//    NSMutableAttributedString *attributedString =
//    [[NSMutableAttributedString alloc] initWithString:content
//                                           attributes:attr];
//    [attributedString addAttributes:@{(id)kCTForegroundColorAttributeName:(id)[UIColor redColor].CGColor} range:NSMakeRange(0, 7)];
////    [attributedString addAttribute:NSForegroundColorAttributeName
////                             value:(id)[UIColor greenColor].CGColor
////                             range:NSMakeRange(0, 7)];
//    CoreTextData *data = [CTFrameParser parseAttributeContent:attributedString config:config];
//    self.ctView.data = data;
//    self.ctView.frame = CGRectMake(0, 0, config.width, data.height);
//    self.ctView.backgroundColor = [UIColor yellowColor];
    TNNMessageBody *messageBody = [[TNNMessageBody alloc] init];
    messageBody.content = @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
    " 换为 CoreTextData 的方法。"
    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
    " 示成黑色，那么就办不到了。"
    "\n\n"
    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
    " 我们想要的信息。";

    self.ctView.data = messageBody.textData;
    self.ctView.frame = CGRectMake(10, 20, [messageBody messageContentSize].width, [messageBody messageContentSize].height);
    self.ctView.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
