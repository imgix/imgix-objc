//
//  IGXClient+PDF.m
//  Imgix
//
//  Created by Sam Soffes on 5/23/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#import "IGXClient+PDF.h"
#import "IGXClient+Private.h"

@implementation IGXClient (PDF)

- (void)setPDFPage:(NSUInteger)PDFPage {
	self.options[@"page"] = @(PDFPage);
}

- (NSUInteger)PDFPage {
	return [self.options[@"page"] unsignedIntegerValue];
}

@end
