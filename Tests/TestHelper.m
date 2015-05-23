//
//  TestHelper.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "TestHelper.h"

@implementation TestCase

@synthesize client = _client;

- (IGXClient *)client {
	if (!_client) {
		_client = [[IGXClient alloc] initWithHost:@"nothingmagical.imgix.net" token:nil];
	}
	return _client;
}

@end
