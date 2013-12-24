//
//  RFSNFourSquareVenuePhotosResponse.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenuePhotosResponse.h"
#import "RFSNFourSquareVenuePhoto.h"
#import "RFSNFourSquareVenuePhotosRequest.h"





@implementation RFSNFourSquareVenuePhotosResponse

-(id)initWithRequestObject:(RNNetworkRequest *)request responseObject:(id)responseObject
{
    if (self = [super initWithRequestObject:request responseObject:responseObject])
    {
        if (self.successfulResponse)
        {
            _venuePhotos = [NSArray arrayWithArray:[RFSNFourSquareVenuePhoto fourSquareVenuePhotosForResponseDict:[self.responseDictionary objectForKey:@"response"]]];
        }
    }
    
    return self;
}

@end
