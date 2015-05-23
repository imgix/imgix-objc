//
//  IGXClient+Adjustment.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"

/**
 Make adjustments to an image.
 */
@interface IGXClient (Adjustment)

/**
 Adjusts the brightness of the image. Valid values are in the range `-100` to `100`. The default
 value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSInteger brightness;

/**
 Adjusts the contrast of the image. Valid values are in the range `-100` to `100`. The default value
 is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSInteger contrast;

/**
 Adjusts the exposure setting for an image similar to the way you control exposure for a camera when
 you change the F-stop. Valid values are in the range `-100` to `100`. The default value is `0`
 which leaves the image unchanged.
 */
@property (nonatomic) NSInteger exposure;

/**
 Adjusts gamma/midtone brightness. Valid values are in the range `-100` to `100`. The default value
 is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSInteger gamma;

/**
 Adjusts the highlight tonal mapping of an image while preserving spatial detail. Valid values are
 in the range `-100` to `100`. The default value is 0 which leaves the image unchanged.
 */
@property (nonatomic) NSInteger highlights;

/**
 Inverts all the pixel colors and brightness values within the image producing a negative of the
 image.
 */
@property (nonatomic) BOOL invert;

/**
 Adjusts the saturation of the image. Valid values are in the range `-100` to `100`. The default
 value is `0` which leaves the image unchanged. A value of `-100` will convert the image to
 grayscale.
 */
@property (nonatomic) NSInteger saturation;

/**
 Adjusts the shadow tonal mapping of an image while preserving spatial detail. Valid values are in
 the range `-100` to `100`. The default value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSInteger shadows;

/**
 Sharpens the image details using luminance sharpening. Valid values are in the range `0` - `100`.
 The default value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSUInteger sharpen;

/**
 Sharpens the image details using an unsharp mask. Valid values are any floating point number. The
 default value is `0` which leaves the image unchanged. This parameter should be used in conjunction
 with unsharp mask radius.

 For images with general noise, we suggest using the sharp parameter instead. Unsharp mask and
 radius are better for thumbnails and fine-tuned sharpening.
 */
@property (nonatomic) double unsharpMask;

/**
 Determines how many pixels should be included in enhancing the contrast when using the unsharp mask
 parameter. Valid values are positive numbers, and the default is `2.5`. This parameter will have no
 effect on the image if `usm` is unspecified.

 For images with general noise, we suggest using the sharp parameter instead. Unsharp mask and
 radius are better for thumbnails and fine-tuned sharpening.
 */
@property (nonatomic) double unsharpMaskRadius;

/**
 Adjusts the vibrance of an image while keeping pleasing skin tones. Valid values are in the range
 `-100` to `100`. The default value is `0` which leaves the image unchanged.
 */
@property (nonatomic) NSInteger vibrance;

@end
