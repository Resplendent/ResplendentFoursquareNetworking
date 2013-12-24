//
//  RFSNFourSquareVenueRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueRequest.h"
#import "RFSNFourSquareVenueRequestUtil.h"
#import "RFSNFourSquareVenueResponse.h"





@implementation RFSNFourSquareVenueRequest

#pragma mark - Overloaded
+(Class)responseClass
{
    return [RFSNFourSquareVenueResponse class];
}

#pragma mark - Public methods
-(void)fetchWithFourSquareVenueId:(NSString*)fourSquareVenueId
{
    if (!fourSquareVenueId.length)
        [NSException raise:NSInvalidArgumentException format:@"Need a non nil fourSquareVenueId"];
    
    _fourSquareVenueId = fourSquareVenueId;
    
    NSString* urlString = [RFSNFourSquareVenueRequestUtil urlForVenueWithId:fourSquareVenueId];
    
    [self fetchWithUrl:[NSURL URLWithString:urlString]];
}

@end
