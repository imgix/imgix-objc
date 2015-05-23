//
//  IGXClient.h
//  Imgix
//
//  Created by Sam Soffes on 5/22/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import Foundation;

#import "IGXNullability.h"

@interface IGXClient : NSObject

#pragma mark - Initializers

- (nonnull instancetype)initWithHost:(nonnull NSString *)host token:(nullable NSString *)token;


#pragma mark - Configuration

@property (nonnull, nonatomic, readonly) NSString *host;
@property (nullable, nonatomic, readonly) NSString *token;
@property (nonatomic) BOOL secure;


#pragma mark - URL Building

- (nullable NSURL *)URLWithPath:(nonnull NSString *)path;

@end
