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
	self.options[@"gam"] = @(gamma);
}

- (NSInteger)gamma {
	return [self.options[@"gam"] integerValue];
}

- (void)setHighlights:(NSInteger)highlights {
	NSAssert(highlights >= -100 && highlights <= 100, @"[IGXClient] Invalid highlights. Value must be between -100 and 100.");
	self.options[@"high"] = @(highlights);
}

- (NSInteger)highlights {
	return [self.options[@"high"] integerValue];
}

- (void)setInvert:(BOOL)invert {
	if (invert) {
		self.options[@"invert"] = @"true";
	} else {
		[self.options removeObjectForKey:@"invert"];
	}
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

- (void)setShadows:(NSInteger)shadows {
	NSAssert(shadows >= -100 && shadows <= 100, @"[IGXClient] Invalid shadows. Value must be between -100 and 100.");
	self.options[@"shad"] = @(shadows);
}

- (NSInteger)shadows {
	return [self.options[@"shad"] integerValue];
}

- (void)setSharpen:(NSUInteger)sharpen {
	NSAssert(sharpen >= 0 && sharpen <= 100, @"[IGXClient] Invalid sharpen. Value must be between 0 and 100.");
	self.options[@"sharp"] = @(sharpen);
}

- (NSUInteger)sharpen {
	return [self.options[@"sharp"] unsignedIntegerValue];
}

- (void)setUnsharpMask:(double)unsharpMask {
	self.options[@"usm"] = @(unsharpMask);
}

- (double)unsharpMask {
	return [self.options[@"usm"] doubleValue];
}

- (void)setUnsharpMaskRadius:(double)unsharpMaskRadius {
	NSAssert(unsharpMaskRadius >= 0.0, @"[IGXClient] Invalid unsharp mask radius. Value must be above 0.");
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
