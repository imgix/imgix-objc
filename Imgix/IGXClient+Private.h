//
//  IGXClient+Private.h
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXNullability.h"

@class NSMutableDictionary;

@interface IGXClient (Private)

@property (nonatomic, readonly, igx_nonnull) NSMutableDictionary *options;

- (void)setBool:(BOOL)value forKey:(igx_nonnull NSString *)key;

@end
