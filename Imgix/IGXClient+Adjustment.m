//
//  IGXClient+Adjustment.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient+Adjustment.h"
#import "IGXClient+Private.h"

@implementation IGXClient (Adjustment)

- (void)setBrightness:(NSInteger)brightness {
	NSAssert(brightness >= -100 && brightness <= 100, @"[IGXClient] Invalid brightness. Value must be between -100 and 100.");
	self.options[@"bri"] = @(brightness);
}

- (NSInteger)brightness {
	return [self.options[@"bri"] integerValue];
}

- (void)setContrast:(NSInteger)contrast {
	NSAssert(contrast >= -100 && contrast <= 100, @"[IGXClient] Invalid contrast. Value must be between -100 and 100.");
	self.options[@"con"] = @(contrast);
}

- (NSInteger)contrast {
	return [self.options[@"con"] integerValue];
}

- (void)setExposure:(NSInteger)exposure {
	NSAssert(exposure >= -100 && exposure <= 100, @"[IGXClient] Invalid exposure. Value must be between -100 and 100.");
	self.options[@"exp"] = @(exposure);
}

- (NSInteger)exposure {
	return [self.options[@"exp"] integerValue];
}

- (void)setGamma:(NSInteger)gamma {
	NSAssert(gamma >= -100 && gamma <= 100, @"[IGXClient] Invalid gamma. Value must be between -100 and 100.");
	self.options[@"gamma"] = @(gamma);
}

- (NSInteger)gamma {
	return [self.options[@"gam"] integerValue];
}

- (void)setHighlight:(NSInteger)highlight {
	NSAssert(highlight >= -100 && highlight <= 100, @"[IGXClient] Invalid highlight. Value must be between -100 and 100.");
	self.options[@"high"] = @(highlight);
}

- (NSInteger)highlight {
	return [self.options[@"high"] integerValue];
}

- (void)setInvert:(BOOL)invert {
	self.options[@"invert"] = @(invert);
}

- (BOOL)invert {
	return [self.options[@"invert"] boolValue];
}

- (void)setSaturation:(NSInteger)saturation {
	NSAssert(saturation >= -100 && saturation <= 100, @"[IGXClient] Invalid saturation. Value must be between -100 and 100.");
	self.options[@"sat"] = @(saturation);
}

- (NSInteger)saturation {
	return [self.options[@"sat"] integerValue];
}

- (void)setShadow:(NSInteger)shadow {
	NSAssert(shadow >= -100 && shadow <= 100, @"[IGXClient] Invalid shadow. Value must be between -100 and 100.");
	self.options[@"shad"] = @(shadow);
}

- (NSInteger)shadow {
	return [self.options[@"shad"] integerValue];
}

- (void)setSharpen:(NSInteger)sharpen {
	NSAssert(sharpen >= 0 && sharpen <= 100, @"[IGXClient] Invalid sharpen. Value must be between 0 and 100.");
	self.options[@"sharp"] = @(sharpen);
}

- (NSInteger)sharpen {
	return [self.options[@"sharp"] integerValue];
}

- (void)setUnsharpMask:(NSInteger)unsharpMask {
	self.options[@"usm"] = @(unsharpMask);
}

- (NSInteger)unsharpMask {
	return [self.options[@"usm"] integerValue];
}

- (void)setUnsharpMaskRadius:(double)unsharpMaskRadius {
	self.options[@"usmrad"] = @(unsharpMaskRadius);
}

- (double)unsharpMaskRadius {
	NSNumber *value = self.options[@"usmrad"];
	return value ? [value doubleValue] : 2.5;
}

- (void)setVibrance:(NSInteger)vibrance {
	NSAssert(vibrance >= -100 && vibrance <= 100, @"[IGXClient] Invalid vibrance. Value must be between -100 and 100.");
	self.options[@"vib"] = @(vibrance);
}

- (NSInteger)vibrance {
	return [self.options[@"vib"] integerValue];
}

@end
