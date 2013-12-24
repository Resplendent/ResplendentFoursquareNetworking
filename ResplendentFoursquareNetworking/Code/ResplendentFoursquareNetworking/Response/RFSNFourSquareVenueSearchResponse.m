//
//  RFSNFourSquareVenueSearchResponse.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueSearchResponse.h"
#import "RFSNFourSquareVenue.h"





@implementation RFSNFourSquareVenueSearchResponse

-(id)initWithRequestObject:(RNNetworkRequest *)request responseObject:(id)responseObject
{
    if (self = [super initWithRequestObject:request responseObject:responseObject])
    {
        if (self.successfulResponse)
        {
            _venues = [RFSNFourSquareVenue fourSquareVenueArrayFromSearchJsonResponse:self.responseDictionary];
        }
    }
    
    return self;
}

@end
