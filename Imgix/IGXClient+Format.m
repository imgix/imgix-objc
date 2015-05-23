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

- (void)setDownloadFileName:(igx_nullable NSString *)downloadFileName {
	self.options[@"dl"] = downloadFileName;
}

- (igx_nullable NSString *)downloadFileName {
	return self.options[@"dl"];
}

- (void)setFormat:(IGXFormat)format {
	self.options[@"fm"] = IGXFormatString(format);
}

- (IGXFormat)format {
	return IGXFormatFromString(self.options[@"fm"]);
}

- (void)setQuality:(NSUInteger)quality {
	NSAssert(quality >= 0 && quality <= 100, @"[IGXClient] Invalid quality. Value must be between 0 and 100.");
	self.options[@"q"] = @(quality);
}

- (NSUInteger)quality {
	NSNumber *value = self.options[@"q"];
	return value ? [value unsignedIntegerValue] : 75;
}

- (void)setFramesPerSecond:(NSUInteger)framesPerSecond {
	self.options[@"fps"] = @(framesPerSecond);
}

- (NSUInteger)framesPerSecond {
	return [self.options[@"fps"] unsignedIntegerValue];
}


- (void)setFrame:(NSUInteger)frame {
	self.options[@"frame"] = @(frame);
}

- (NSUInteger)frame {
	return [self.options[@"frame"] unsignedIntegerValue];
}

- (void)setLoop:(BOOL)loop {
	[self setBool:loop forKey:@"loop"];
}

- (BOOL)loop {
	return [self.options[@"loop"] boolValue];
}

- (void)setReverse:(BOOL)reverse {
	[self setBool:reverse forKey:@"reverse"];
}

- (BOOL)reverse {
	return [self.options[@"reverse"] boolValue];
}

@end
