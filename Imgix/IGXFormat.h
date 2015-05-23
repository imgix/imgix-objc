//
//  IGXFormat.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import Foundation;

#import "IGXNullability.h"

typedef NS_ENUM(NSUInteger, IGXFormat) {
	/**
	 Default. No change in image format.
	 */
	IGXFormatIdentity,

	/**
	 The GIF image format is a file format popularized for its ability to create simple animations.

	 The GIF file format is a lossy format. It does support transparency, although in a very limited
	 capacity (1-bit). It does support animation.

	 @see fps
	 @see frame
	 @see loop
	 @see reverse
	 */
	IGXFormatGIF,

	/**
	 JPEG is one of the most common formats on the web. It excels at displaying photographs.

	 The JPEG file format is a lossy format. It does not support transparency. It does not support
	 animation.

	 @see quality
	 */
	IGXFormatJPEG,

	/**
	 JPEG 2000 compresses slightly better than JPEG in many cases (roughly 10% for equivalent
	 quality). It also degrades more gracefully than JPEG at lower bitrates. However, unlike JPEG,
	 JPEG 2000 was less widely adopted as an image format.

	 The JPEG 2000 file format is a lossy format. It does not support transparency. It does not
	 support animation.

	 @see quality
	 */
	IGXFormatJPEG2000,

	/**
	 JPEG XR file format supports higher compression ratios in comparison to JPEG for encoding an
	 image with equivalent quality. In order to have a JPEG XR file delivered as lossless, set
	 `lossless` to `YES`.

	 The JPEG XR file format is a lossy format, but supports lossless compression. It does support
	 transparency. It does not support animation.

	 @see lossless
	 @see quality
	 */
	IGXFormatJPEGXR,

	/**
	 A non-image, JSON file format. This is a data representation of the image specified. This will
	 include keys and values relating to the source image DPI, height, width, color profiles, color
	 models, bit depth, and more. The output data will vary depend on input filetype.
	 */
	IGXFormatJSON,

	/**
	 imgix offers the MP4 format for Animated GIF to MP4 conversion. MP4 is a video format that will
	 reproduce animations at a much smaller file size than Animated GIFs. MP4 is to be used with the
	 video tag, see below. MP4 will accept any imgix operations passed to the Animated GIF.
	 */
	IGXFormatMP4,

	/**
	 The Progressive JPEG format offers advantages over traditional JPEG files. The advantages
	 include potentially smaller file sizes and faster perceived load times than typical baseline
	 JPEGs.

	 The Progressive JPEG file format is a lossy format. It does not support transparency. It does
	 not support animation.

	 @see quality
	 */
	IGXFormatProgressiveJPEG,

	/**
	 The PNG file format is a common graphics format, often used for application assets.

	 The PNG file format is a lossless format. It does support transparency. It does not support
	 animation.
	 */
	IGXFormatPNG,

	/**
	 WebP can be either a lossless or a lossy image file format. WebP lossless images are 26%
	 smaller in size compared to PNGs. WebP lossy images are 25-34% smaller in size compared to
	 JPEG images.

	 WebP also supports lossless compression and alpha transparency with a notable reduction in file
	 size compared to PNG. To have a WebP file delivered as lossless, set `lossless` to `YES`.

	 Converting animated GIFs to WebP will produce WebP Animations.

	 The WebP file format is a lossy image format, but supports lossless compression. It does
	 support transparency. It does support animation.

	 @see lossless
	 @see quality
	 */
	IGXFormatWebP
};

extern  NSString * __nullable IGXFormatString(IGXFormat format);
extern  IGXFormat IGXFormatFromString(NSString *__nullable string);
