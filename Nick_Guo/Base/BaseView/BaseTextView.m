//
//  BaseTextView.m
//  自定义View
//
//  Created by dfhb@rdd on 15/11/12.
//  Copyright © 2015年 GW. All rights reserved.
//

#import "BaseTextView.h"

@interface BaseTextView ()
@property (nonatomic, weak) UILabel *placeholderLabel;
@end
@implementation BaseTextView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 1.添加提示文字
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.textColor = [UIColor lightGrayColor];
        placeholderLabel.hidden = YES;
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        [self insertSubview:placeholderLabel atIndex:0];
        self.placeholderLabel = placeholderLabel;
        self.font = self.placeholderLabel.font;
        
        // 2.监听textView文字改变的通知
        [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    if (placeholder.length) { // 需要显示
        self.placeholderLabel.hidden = NO;
        
        // 计算frame
        CGFloat placeholderX = 5;
        CGFloat placeholderY = 7;
        CGFloat maxW = self.frame.size.width - 2 * placeholderX;
        CGFloat maxH = self.frame.size.height - 2 * placeholderY;
        
        NSDictionary *attrs = @{NSFontAttributeName:self.placeholderLabel.font};
        
        CGSize maxSize = CGSizeMake(maxW, maxH);
        CGSize placeholderSize = [placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width, placeholderSize.height);
    } else {
        self.placeholderLabel.hidden = YES;
    }
    [self textDidChange];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    self.placeholder = self.placeholder;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.placeholder = self.placeholder;
}
- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange];
}
- (void)textDidChange {
    self.placeholderLabel.hidden = (self.text.length != 0);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
