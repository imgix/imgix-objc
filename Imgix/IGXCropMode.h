//
//  IGXCropMode.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import Foundation;

typedef NS_OPTIONS(NSUInteger, IGXCropMode) {
	/// Default. Crop to the center of the image.
	IGXCropModeCenter = 0,

	/// Crop from the top of the image, down.
	IGXCropModeTop = 1 << 0,

	/// Crop from the bottom of the image, up.
	IGXCropModeBottom = 1 << 1,

	/// Crop from the left of the image, right.
	IGXCropModeLeft = 1 << 2,

	/// Crop from the right of the image, left.
	IGXCropModeRight = 1 << 3,

	/**
	 If faces are detected in the image, attempts to center the crop to them. Otherwise, the
	 cropping alignment will default to centered if no additional values are provided.
	 */
	IGXCropModeFaces = 1 << 4
};
