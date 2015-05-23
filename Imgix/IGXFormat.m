//
//  IGXFormat.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXFormat.h"

NSString * __nullable IGXFormatString(IGXFormat format) {
	switch (format) {
		case IGXFormatIdentity: {
			return nil;
		}
		case IGXFormatGIF: {
			return @"gif";
		}
		case IGXFormatJPEG: {
			return @"jpg";
		}
		case IGXFormatJPEG2000: {
			return @"jp2";
		}
		case IGXFormatJPEGXR: {
			return @"jxr";
		}
		case IGXFormatJSON: {
			return @"json";
		}
		case IGXFormatMP4: {
			return @"mp4";
		}
		case IGXFormatProgressiveJPEG: {
			return @"pjpg";
		}
		case IGXFormatPNG: {
			return @"png";
		}
		case IGXFormatWebP: {
			return @"webp";
		}
	}
}


IGXFormat IGXFormatFromString(NSString *__nonnull string) {
	if (!string || string.length == 0) {
		return IGXFormatIdentity;
	}

	string = [string lowercaseString];

	if ([string isEqualToString:@"gif"]) {
		return IGXFormatGIF;
	} else if ([string isEqualToString:@"jpg"]) {
		return IGXFormatJPEG;
	} else if ([string isEqualToString:@"jp2"]) {
		return IGXFormatJPEG2000;
	} else if ([string isEqualToString:@"jxr"]) {
		return IGXFormatJPEGXR;
	} else if ([string isEqualToString:@"json"]) {
		return IGXFormatJSON;
	} else if ([string isEqualToString:@"mp4"]) {
		return IGXFormatMP4;
	} else if ([string isEqualToString:@"pjpg"]) {
		return IGXFormatProgressiveJPEG;
	} else if ([string isEqualToString:@"png"]) {
		return IGXFormatPNG;
	} else if ([string isEqualToString:@"webp"]) {
		return IGXFormatWebP;
	}

	NSCAssert(NO, @"[IGXFormat] Invalid format string.");
	return IGXFormatIdentity;
}
