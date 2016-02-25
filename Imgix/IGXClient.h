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

- (igx_nonnull instancetype)initWithHost:(igx_nonnull NSString *)host token:(igx_nullable NSString *)token;


#pragma mark - Configuration

@property (nonatomic, readonly, igx_nonnull) NSString *host;
@property (nonatomic, readonly, igx_nullable) NSString *token;
@property (nonatomic) BOOL secure;


#pragma mark - URL Building

- (igx_nullable NSURL *)URLWithPath:(igx_nonnull NSString *)path;
- (igx_nullable NSURL *)URLWithPath:(igx_nonnull NSString *)path andOptions:(igx_nonnull NSDictionary*)options;

@end
