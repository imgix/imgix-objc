//
//  IGXClient+Format.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"
#import "IGXFormat.h"

@interface IGXClient (Format)

//@property (nonatomic) BOOL download;

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

//@property (nonatomic) NSUInteger fps;
//@property (nonatomic) NSUInteger frame;
//@property (nonatomic) BOOL loop;
//@property (nonatomic) BOOL reverse;

@end
