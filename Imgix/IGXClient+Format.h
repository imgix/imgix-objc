//
//  IGXClient+Format.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"
#import "IGXFormat.h"
#import "IGXNullability.h"

/**
 Select the output format of your image.
 */
@interface IGXClient (Format)

/**
 Disired download file name. When set with an `a` tag, will force a browser to download an image
 instead of opening the image in a new window.
 */
@property (nonatomic, igx_nullable) NSString *downloadFileName;

/**
 The output format to convert the image to.
 
 @see IGXFormat
 */
@property (nonatomic) IGXFormat format;

/**
 Controls the output quality of lossy file formats. Applies when then `format` is set to
 `IGXFormatJPEG` `IGXFormatProgressiveJPEG`, `IGXFormatWebP`, or `IGXFormatJPEGXR`. Valid values are
 in the range `0` - `100`. The default value is `75`.
 */
@property (nonatomic) NSUInteger quality;

@property (nonatomic) NSUInteger framesPerSecond;
@property (nonatomic) NSUInteger frame;
@property (nonatomic) BOOL loop;
@property (nonatomic) BOOL reverse;

@end
