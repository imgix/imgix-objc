//
//  IGXClient.m
//  Imgix
//
//  Created by Sam Soffes on 5/22/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient.h"
#import "NSString+Imgix.h"

@interface IGXClient ()
@property (nonatomic, readwrite, igx_nonnull) NSString *host;
@property (nonatomic, readwrite, igx_nullable) NSString *token;
@property (nonatomic, readonly) NSMutableDictionary *options;
@end

@implementation IGXClient

#pragma mark - Accessors

@synthesize options = _options;
@synthesize host = _host;
@synthesize token = _token;
@synthesize secure = _secure;


#pragma mark - Initializers

- (instancetype)init {
	if ((self = [super init])) {
		self.secure = YES;
	}
	return self;
}

- (igx_nonnull instancetype)initWithHost:(igx_nonnull NSString *)host token:(igx_nullable NSString *)token {
	if ((self = [self init])) {
		self.host = host;
		self.token = token;
	}
	return self;
}


#pragma mark - Configuration

- (NSMutableDictionary *)options {
	if (!_options) {
		_options = [[NSMutableDictionary alloc] init];
	}
	return _options;
}


#pragma mark - URL Building

- (NSString *)queryStringWithPath:(NSString *)path {
	NSMutableArray *components = [[NSMutableArray alloc] init];
	NSArray *keys = [[self.options allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
	[keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
		id value = self.options[key];
		[components addObject:[[NSString alloc] initWithFormat:@"%@=%@", key, value]];
	}];

	NSString *query = [components componentsJoinedByString:@"&"];

	if (self.token) {
		NSString *input = [[NSString alloc] initWithFormat:@"%@%@?%@", self.token, path, query];
		NSString *signature = [input imgix_MD5];
		[components addObject:[[NSString alloc] initWithFormat:@"s=%@", signature]];
		query = [components componentsJoinedByString:@"&"];
	}

	return query;
}

- (igx_nullable NSURL *)URLWithPath:(igx_nonnull NSString *)path {
	NSString *scheme = self.secure ? @"https" : @"http";

    if ([path hasPrefix:@"http"]) {
        path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
        path = [path stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
    }

	if (![path hasPrefix:@"/"]) {
		path = [@"/" stringByAppendingString:path];
	}

	NSString *query = [self queryStringWithPath:path];
	if (query.length > 0) {
		query = [@"?" stringByAppendingString:query];
	}

	NSString *string = [[NSString alloc] initWithFormat:@"%@://%@%@%@", scheme, self.host, path, query];
	return [[NSURL alloc] initWithString:string];
}


#pragma mark - Private

- (void)setBool:(BOOL)value forKey:(igx_nonnull NSString *)key {
	if (value) {
		self.options[key] = @"true";
	} else {
		[self.options removeObjectForKey:key];
	}
}

@end
