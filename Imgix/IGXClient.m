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
@property (nonatomic, readwrite, igx_nonnull) NSDictionary *options;
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

- (NSDictionary *)options {
	if (!_options) {
		_options = [[NSDictionary alloc] init];
	}
	return _options;
}


#pragma mark - URL Building

- (NSString *)queryStringWithPath:(NSString *)path {
	NSMutableArray *components = [[NSMutableArray alloc] init];
	NSArray *keys = [[self.options allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
	[keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
		id value = self.options[key];
        
        NSString *encodedKey = [[[NSString alloc] initWithFormat:@"%@", key] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *stringifiedValue = [[NSString alloc] initWithFormat:@"%@", value];
        NSString *encodedValue;
        
        if ([encodedKey hasSuffix:@"64"]) {
            NSData *valueData = [stringifiedValue dataUsingEncoding:NSUTF8StringEncoding];
            NSString *base64Value = [valueData base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)kNilOptions];
            
            encodedValue = [base64Value stringByReplacingOccurrencesOfString:@"=" withString:@""];
            encodedValue = [encodedValue stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
            encodedValue = [encodedValue stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
        } else {
            encodedValue = [stringifiedValue stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        }
        
        
		[components addObject:[[NSString alloc] initWithFormat:@"%@=%@", encodedKey, encodedValue]];
	}];

	NSString *query = [components componentsJoinedByString:@"&"];
    if (query.length > 0) {
        query = [@"?" stringByAppendingString:query];
    }

	if (self.token) {
		NSString *input = [[NSString alloc] initWithFormat:@"%@%@%@", self.token, path, query];
		NSString *signature = [input imgix_MD5];
        
		[components addObject:[[NSString alloc] initWithFormat:@"s=%@", signature]];
		query = [components componentsJoinedByString:@"&"];
        
        if (query.length > 0) {
            query = [@"?" stringByAppendingString:query];
        }
	}

	return query;
}

- (igx_nullable NSURL *)URLWithPath:(igx_nonnull NSString *)path {
    if (!self.options) {
        self.options = [[NSDictionary alloc] init];
    }
    
    NSString *scheme = self.secure ? @"https" : @"http";
    
    if ([path hasPrefix:@"http://"] || [path hasPrefix:@"https://"]) {
        path = (NSString * _Nonnull)[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    }
    
    if (![path hasPrefix:@"/"]) {
        path = [@"/" stringByAppendingString:path];
    }
    
    NSString *query = [self queryStringWithPath:path];
    
    NSString *string = [[NSString alloc] initWithFormat:@"%@://%@%@%@", scheme, self.host, path, query];
    return [[NSURL alloc] initWithString:string];
}

- (igx_nullable NSURL *)URLWithPath:(igx_nonnull NSString *)path andOptions:(igx_nonnull NSDictionary *)options {
    self.options = options;

    return [self URLWithPath:path];
}

@end
