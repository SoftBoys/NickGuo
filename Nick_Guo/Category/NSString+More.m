//
//  NSString+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/3/17.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "NSString+More.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (More)
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize Space:(float)space
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    NSDictionary *attrs = @{NSFontAttributeName : font,NSParagraphStyleAttributeName:paragraphStyle};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

// 是否为手机号码
- (BOOL)isPhone
{
    NSString *Regex = @"^(0|86|17951)?(13[0-9]|15[012356789]|16[0123456789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [phoneTest evaluateWithObject:self];
}
// 校验身份证号码
- (BOOL)isIdentify
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    //    NSLog(@"%@",locationString);
    
    int y3 = (int)[[locationString substringWithRange:NSMakeRange(2, 1)] integerValue];
    int y4 = (int)[[locationString substringWithRange:NSMakeRange(3, 1)] integerValue];
    //    NSLog(@"%d%d",y3,y4);
    
    NSString *regex2 = [NSString stringWithFormat:@"^(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|71|8[1-2])\\d{4}(19\\d{2}|20([0-%d][0-9]|%d[0-%d]))(((0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])))\\d{3}([0-9]|x|X)$",y3 - 1,y3,y4];
    
    //    NSLog(@"%@", regex2);
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isEmail
{
    NSString *Regex = [NSString stringWithFormat:@"^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"];
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [phoneTest evaluateWithObject:self];
}
- (BOOL)isPayPrice
{
    NSString *Regex = @"^[0-9]+(.[0-9]{0,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [phoneTest evaluateWithObject:self];
}

- (NSURL *)imageUrl
{
    NSURL *url = [NSURL URLWithString:self];
    return url;
}
@end
