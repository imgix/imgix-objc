//
//  NSString+Imgix.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "NSString+Imgix.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Imgix)

- (igx_nonnull NSString *)imgix_MD5 {
	const char *cstr = [self UTF8String];
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cstr, (CC_LONG)strlen(cstr), digest);

	NSMutableString *md5 = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

	for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[md5 appendFormat: @"%02x", (int)digest[i]];
	}

	return md5;
}

- (nullable NSString *)encodeURIComponent {
    NSString *unreserved = @"-_.!~*'()";
    NSMutableCharacterSet *allowed = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowed addCharactersInString:unreserved];
    return [self stringByAddingPercentEncodingWithAllowedCharacters: allowed];
}

@end
