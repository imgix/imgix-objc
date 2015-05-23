//
//  IGXClient+Background.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import CoreGraphics;

#import "IGXClient.h"
#import "IGXNullability.h"

/**
 Control the background of your image.
 */
@interface IGXClient (Background)

/**
 The background color to use when transparency is encountered. The default is transparent white.
 For image formats that do not support transparency, set this value to a non-transparent color.
 */
//@property (nonatomic, igx_nullable) CGColorRef backgroundColor;

@end
