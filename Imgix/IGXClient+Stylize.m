//
//  IGXClient+Stylize.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient+Stylize.h"
#import "IGXClient+Private.h"

@implementation IGXClient (Stylize)

- (void)setBlur:(NSUInteger)blur {
	NSAssert(blur >= 0 && blur <= 2000, @"[IGXClient] Invalid blur. Value must be between 0 and 2000.");
	self.options[@"blur"] = @(blur);
}

- (NSUInteger)blur {
	return [self.options[@"blur"] unsignedIntegerValue];
}

- (void)setHalftone:(NSUInteger)halftone {
	NSAssert(halftone >= 0 && halftone <= 100, @"[IGXClient] Invalid halftone. Value must be between 0 and 100.");
	self.options[@"htn"] = @(halftone);
}

- (NSUInteger)halftone {
	return [self.options[@"htn"] unsignedIntegerValue];
}

- (void)setPixelate:(NSUInteger)pixelate {
	NSAssert(pixelate >= 0 && pixelate <= 100, @"[IGXClient] Invalid pixelate. Value must be between 0 and 100.");
	self.options[@"px"] = @(pixelate);
}

- (NSUInteger)pixelate {
	return [self.options[@"px"] unsignedIntegerValue];
}

- (void)setSepia:(NSUInteger)sepia {
	NSAssert(sepia >= 0 && sepia <= 100, @"[IGXClient] Invalid sepia. Value must be between 0 and 100.");
	self.options[@"sepia"] = @(sepia);
}

- (NSUInteger)sepia {
	return [self.options[@"sepia"] unsignedIntegerValue];
}

@end
