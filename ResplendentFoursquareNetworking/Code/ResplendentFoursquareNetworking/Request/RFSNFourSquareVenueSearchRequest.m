//
//  RFSNFourSquareVenueSearchRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueSearchRequest.h"
#import "RFSNFourSquareVenueRequestUtil.h"
#import "RFSNFourSquareVenueSearchResponse.h"

#import "RUConstants.h"
#import "RUDLog.h"





@implementation RFSNFourSquareVenueSearchRequest

-(void)fetchWithCurrentInfo
{
    NSString* urlString = self.urlString;
    if (urlString.length)
    {
        NSURL* url = [NSURL URLWithString:urlString];
        if (url)
        {
            [self fetchWithUrl:url];
        }
        else
        {
            RUDLog(@"couldn't make url from url string %@",urlString);
        }
    }
    else
    {
        RUDLog(@"we need a url string!");
    }
}

-(void)fetchWithSearchText:(NSString*)searchText latitude:(double)latitude longitude:(double)longitude limit:(NSInteger)limit
{
    _latitude = latitude;
    _longitude = longitude;
    _searchText = searchText;
    _limit = limit;

    [self fetchWithCurrentInfo];
}

#pragma mark - Overloaded
+(Class)responseClass
{
    return [RFSNFourSquareVenueSearchResponse class];
}

#pragma mark - Getters
-(NSString *)urlString
{
    if (!self.latitude || !self.longitude)
    {
        return nil;
    }

    return [RFSNFourSquareVenueRequestUtil searchUrlWithSearchText:self.searchText latitude:self.latitude longitude:self.longitude limit:self.limit];
}

@end
