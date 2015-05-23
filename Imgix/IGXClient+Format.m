//
//  IGXClient+Format.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient+Format.h"
#import "IGXClient+Private.h"

@implementation IGXClient (Format)

- (void)setFormat:(IGXFormat)format {
	self.options[@"format"] = IGXFormatString(format);
}

- (IGXFormat)format {
	return IGXFormatFromString(self.options[@"format"]);
}

- (void)setQuality:(NSUInteger)quality {
	NSAssert(quality >= 0 && quality <= 100, @"[IGXClient] Invalid quality. Value must be between 0 and 100.");
	self.options[@"q"] = @(quality);
}

- (NSUInteger)quality {
	NSNumber *value = self.options[@"q"];
	return value ? [value doubleValue] : 75;
}

@end
