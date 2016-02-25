//
//  NSString+Imgix.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import Foundation;

#import "IGXNullability.h"

@interface NSString (Imgix)

- (igx_nonnull NSString *)imgix_MD5;
- (nullable NSString *)encodeURIComponent;

@end
