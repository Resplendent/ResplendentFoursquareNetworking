//
//  RFSNFourSquareVenueCategoriesRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueCategoriesRequest.h"
#import "RFSNFourSquareVenueRequestUtil.h"
#import "RFSNFourSquareVenueCategoriesResponse.h"





@implementation RFSNFourSquareVenueCategoriesRequest

-(void)fetch
{
    [self fetchWithUrl:[NSURL URLWithString:[RFSNFourSquareVenueRequestUtil categoriesUrl]]];
}

+(Class)responseClass
{
    return [RFSNFourSquareVenueCategoriesResponse class];
}

@end
