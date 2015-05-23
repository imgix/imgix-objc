//
//  IGXClient+Stylize.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import CoreGraphics;

#import "IGXClient.h"

/**
 Apply styles to your image.
 */
@interface IGXClient (Stylize)

/**
 Applies a gaussian style blur to your image. Valid values are in the range from `0` – `2000`. The
 default value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSUInteger blur;

/**
 Applies a half-toning effect to the image. Valid values are in the range `0` - `100`. The default
 value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSUInteger halftone;

/**
 Applies an overall monochromatic hue change with a specified color. The monochromatic intensity can
 be set by using the alpha compontent.
 */
//@property (nonatomic) CGColorRef monochrome;

/**
 Applies a pixelation effect to the image. Valid values are in the range `0` - `100`. The default
 value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSUInteger pixelate;

/**
 Applies a sepia toning effect to the image. Valid values are in the range from `0` – `100`. The
 default value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSUInteger sepia;

@end
