//
//  IGXNullability.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

// Allow the use of nullability attributes while keeping compatibility with older Xcodes.
#if __has_feature(nullability)
	#define igx_nonnull nonnull
	#define igx_nullable nullable
	#define igx_null_unspecified null_unspecified
	#define __igx_nonnull __nonnull
	#define __igx_nullable __nullable
	#define __igx_null_unspecified __null_unspecified
#else
	#define igx_nonnull
	#define igx_nullable
	#define igx_null_unspecified
	#define __igx_nonnull
	#define __igx_nullable
	#define __igx_null_unspecified
#endif