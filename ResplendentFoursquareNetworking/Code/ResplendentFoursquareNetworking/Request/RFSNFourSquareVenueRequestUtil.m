//
//  RFSNFourSquareVenueRequestUtil.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueRequestUtil.h"
#import "RUClassOrNilUtil.h"
#import "RUConstants.h"





#define kRFSNFourSquareVenueRequestBaseUrlPrefix @"https://api.foursquare.com/v2/venues"
#define kRFSNFourSquareVenueRequestBaseUrlFormatPrefix kRFSNFourSquareVenueRequestBaseUrlPrefix@"/%@"





NSString* const kRFSNFourSquareVenueRequestUtilCategoryUrl = kRFSNFourSquareVenueRequestBaseUrlPrefix@"/categories";

//NSString* const kRFSNFourSquareVenueRequestBaseUrl = kRFSNFourSquareVenueRequestBaseUrlPrefix@"/search";
NSString* const kRFSNFourSquareVenueRequestBaseUrlSearch = kRFSNFourSquareVenueRequestBaseUrlPrefix@"/search";
NSString* const kRFSNFourSquareVenueRequestBaseUrlFormat = kRFSNFourSquareVenueRequestBaseUrlFormatPrefix;
NSString* const kRFSNFourSquareVenueRequestPhotosBaseUrlFormat = kRFSNFourSquareVenueRequestBaseUrlFormatPrefix@"/photos";

NSString* const kRFSNFourSquareVenueRequestApiVersion = @"20130616";





static NSString* __urlParamClientId;
static NSString* __urlParamClientSecret;





@interface RFSNFourSquareVenueRequestUtil ()

+(NSString*)requestURLBaseWithVenueId:(NSString*)venueId;
+(NSString*)photosRequestURLBaseWithVenueId:(NSString*)venueId;

@end





@implementation RFSNFourSquareVenueRequestUtil

#pragma mark - URLs
+(NSString*)urlWithBase:(NSString*)baseURL limit:(int)limit
{
    NSAssert(__urlParamClientId, @"Must set urlParamClientId");
    NSAssert(__urlParamClientSecret, @"Must set urlParamClientSecret");

    NSMutableString* url=[NSMutableString stringWithFormat:@"%@?v=%@",baseURL,kRFSNFourSquareVenueRequestApiVersion];

    NSMutableDictionary* parameters=[[NSMutableDictionary alloc] init];
    [parameters setObject:@"V0NUA5RMLG2KLKKK2VQVIVILI2HQFE2GOYEQWNRSWNOWCQCV" forKey:@"client_id"];
    [parameters setObject:@"CJAQSJQA3RHUCYFNTNJTTZMNZYGFFIRTDXTFVYTDTUP5GU5T" forKey:@"client_secret"];
    
    if (limit)
        [parameters setObject:@(limit) forKey:@"limit"];
    
    for (NSString* key in parameters) {
        id value=[parameters objectForKey:key];
        if ([value isMemberOfClass:[NSNumber class]])
            value=[(NSNumber*)value stringValue];
        [url appendFormat:@"&%@=%@",key,value];
    }
    
    return [NSString stringWithString:url];
}

#pragma mark - Search urls
+(NSString*)searchUrlWithLimit:(int)limit
{
    return [self urlWithBase:kRFSNFourSquareVenueRequestBaseUrlSearch limit:limit];
}

+(NSString*)searchUrlWithSearchText:(NSString*)searchText latitude:(double)latitude longitude:(double)longitude limit:(NSInteger)limit
{
    NSString* urlString = RUStringWithFormat(@"%@&ll=%f,%f",[RFSNFourSquareVenueRequestUtil searchUrlWithLimit:limit],latitude,longitude);

    if (searchText.length)
    {
        return [urlString stringByAppendingFormat:@"&query='%@'",[searchText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    }

    return urlString;
}

#pragma mark - Urls
+(NSString*)photosUrlWithVenueId:(NSString*)venueId limit:(int)limit
{
    return [self urlWithBase:[self photosRequestURLBaseWithVenueId:venueId] limit:limit];
}

+(NSString*)urlForVenueWithId:(NSString*)venueId
{
    return [self urlWithBase:[self requestURLBaseWithVenueId:venueId] limit:0];
}

+(NSString*)categoriesUrl
{
    return [self urlWithBase:kRFSNFourSquareVenueRequestUtilCategoryUrl limit:0];
}

+(NSString*)requestURLBaseWithVenueId:(NSString*)venueId
{
    return RUStringWithFormat(kRFSNFourSquareVenueRequestBaseUrlFormat,venueId);
}

+(NSString*)photosRequestURLBaseWithVenueId:(NSString*)venueId
{
    return RUStringWithFormat(kRFSNFourSquareVenueRequestPhotosBaseUrlFormat,venueId);
}

#pragma mark - Setters
+(void)setClientId:(NSString*)clientId
{
    __urlParamClientId = kRUStringOrNil(clientId);
}

+(void)setClientSecret:(NSString*)clientSecret
{
    __urlParamClientSecret = kRUStringOrNil(clientSecret);
}

@end
