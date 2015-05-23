//
//  IGXNullability.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#ifndef IMGIX_NULLABILITY
	#define IMGIX_NULLABILITY
	#if !__has_feature(nullability)
		#define nullable
		#define __nullable
		#define nonnulll
		#define __nonnulll
	#endif
#endif
