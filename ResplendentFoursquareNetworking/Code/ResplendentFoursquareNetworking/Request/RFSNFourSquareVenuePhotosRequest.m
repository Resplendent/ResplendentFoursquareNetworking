//
//  RFSNFourSquareVenuePhotosRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenuePhotosRequest.h"
#import "RFSNFourSquareVenueRequestUtil.h"
#import "RFSNFourSquareVenuePhotosResponse.h"





@implementation RFSNFourSquareVenuePhotosRequest

#pragma mark - Public methods
-(void)fetchWithFourSquareVenueId:(NSString*)fourSquareVenueId limit:(NSInteger)limit
{
    if (!fourSquareVenueId.length)
        [NSException raise:NSInvalidArgumentException format:@"Need a non nil fourSquareVenueId"];

    _fourSquareVenueId = fourSquareVenueId;

    [self fetchWithUrl:[NSURL URLWithString:[RFSNFourSquareVenueRequestUtil photosUrlWithVenueId:fourSquareVenueId limit:limit]]];
}

#pragma mark - Overloaded
+(Class)responseClass
{
    return [RFSNFourSquareVenuePhotosResponse class];
}

@end
