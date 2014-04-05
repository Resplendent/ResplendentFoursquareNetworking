//
//  RFSNFourSquareVenue.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenue.h"
#import "RUClassOrNilUtil.h"
#import "RUConstants.h"





@interface RFSNFourSquareVenue ()

+(NSString*)cityStateCountryAddressChunkWithAddressDict:(NSDictionary*)addressDict;

@end





@implementation RFSNFourSquareVenue

-(id) initWithFourSquareJSONDict:(NSDictionary*) dict
{
    _infoDict = [NSDictionary dictionaryWithDictionary:dict];
    
    return (self = [self init]);
}

-(id)init
{
    if (self = [super init])
    {
        if (!self.category)
        {
            RUDLog(@"four square venue with dict %@ has no category. this is a test for category effectiveness",_infoDict);
            return nil;
        }
    }
    
    return self;
}

-(NSString *)uid
{
    return [_infoDict objectForKey:@"id"];
}

-(NSNumber *)longitude
{
    return [self.addressDict objectForKey:@"lng"];
}

-(NSNumber *)latitude
{
    return [self.addressDict objectForKey:@"lat"];
}

-(NSString *)category
{
    return self.categoryInfo.RFSNFourSquareVenueCategoryInfoPluralName;
}

-(NSDictionary *)categoryInfo
{
    return (self.categories.count ? [self.categories objectAtIndex:0] : nil);
}

-(NSArray *)categories
{
    return [_infoDict objectForKey:@"categories"];
}

-(NSNumber *)distance
{
    return [self.addressDict objectForKey:@"distance"];
}

-(NSDictionary *)contactInfo
{
    return [_infoDict objectForKey:@"contact"];
}

-(NSString *)contactFormattedPhone
{
    return [self.contactInfo objectForKey:@"formattedPhone"];
}

-(NSDictionary *)addressDict
{
    return [_infoDict objectForKey:@"location"];
}

-(NSString *)name
{
    return [_infoDict objectForKey:@"name"];
}

+(NSString*)categoryIconUrlFromCategoryInfoDict:(NSDictionary*)categoryInfoDict widthClosestTo:(NSInteger)width
{
    NSDictionary* urlDict = [categoryInfoDict objectForKey:@"icon"];
    
    NSNumber* targetedDimension = @(width);

    static NSArray* availableImageWidths;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		//From https://developer.foursquare.com/docs/responses/category
		availableImageWidths = @[@(32),@(44),@(64),@(88)];
	});
//    NSArray* imageSizeArray = [urlDict objectForKey:@"sizes"];

	NSNumber* closestDimension = nil;

	//Finds value closest to and >= targetedDimension
	for (NSNumber* availableImageWidth in availableImageWidths)
	{
		if ((!closestDimension) ||
			((closestDimension.integerValue < targetedDimension.integerValue) && (availableImageWidth.integerValue > closestDimension.integerValue)) ||
			(abs(targetedDimension.integerValue - availableImageWidth.integerValue) < abs(targetedDimension.integerValue - closestDimension.integerValue)))
		{
			closestDimension = availableImageWidth;
		}
	}

    NSString* prefix = [urlDict objectForKey:@"prefix"];
    NSString* suffix = [urlDict objectForKey:@"suffix"];
    
    if (suffix.length)
    {
        //If suffix exists, then we're using bg supported version
        prefix = [prefix stringByAppendingString:@"bg_"];
    }
    else
    {
        suffix = [urlDict objectForKey:@"name"];
    }
    
    return [NSString stringWithFormat:@"%@%@%@",prefix,closestDimension,suffix];
}

-(NSString*)categoryIconUrlWithWidthClosestTo:(NSInteger)width
{
    return [RFSNFourSquareVenue categoryIconUrlFromCategoryInfoDict:self.categoryInfo widthClosestTo:width];
}

-(NSString*)fullAddress
{
    return [[self class]fullAddressWithAddressDict:self.addressDict];
}

-(NSString*)shortAddress
{
    return [self.addressDict objectForKey:@"address"];
}

-(NSString *)url
{
    return [_infoDict objectForKey:@"url"];
}

#pragma mark - static methods
+(instancetype)fourSquareVenueFromResponse:(NSDictionary *)response
{
    NSDictionary* JSONvenue = [[response objectForKey:@"response"] objectForKey:@"venue"];
    return [[self alloc] initWithFourSquareJSONDict:JSONvenue];
}

+(NSMutableArray*)fourSquareVenueArrayFromSearchJsonResponse:(NSDictionary*)jsonResponse
{
    NSArray* venuesJson = [[jsonResponse objectForKey:@"response"] objectForKey:@"venues"];
    
    NSMutableArray* venues = [NSMutableArray arrayWithCapacity:venuesJson.count];
    
    for (NSDictionary* JSONvenue in venuesJson)
    {
        RFSNFourSquareVenue* fsv = [[self alloc] initWithFourSquareJSONDict:JSONvenue];
        if (fsv)
        {
            [venues addObject:fsv];
        }
    }
    
    return venues;
}

+(NSString*)cityStateCountryAddressChunkWithAddressDict:(NSDictionary*)addressDict
{
    NSString* city = kRUStringOrNil(addressDict.RFSNFourSquareVenueLocationInfoCity);
    NSString* state = kRUStringOrNil(addressDict.RFSNFourSquareVenueLocationInfoState);
    NSString* country = kRUStringOrNil(addressDict.RFSNFourSquareVenueLocationInfoCountry);
    
    if (!city.length && !state.length && !country.length)
    {
        return nil;
    }
    
    if (city.length && state.length)
    {
        return RUStringWithFormat(@"%@ %@",city,state);
    }
    else
    {
        if (city.length)
        {
            return city;
        }
        else if (state.length)
        {
            return state;
        }
        else
        {
            return country;
        }
    }
}

+(NSString*)fullAddressWithAddressDict:(NSDictionary*)addressDict
{
    NSString* initialCityStateCountryAddressChunk = [self cityStateCountryAddressChunkWithAddressDict:addressDict];
    if (!initialCityStateCountryAddressChunk.length)
    {
        return nil;
    }

    NSMutableString* fullAddress = [NSMutableString stringWithString:initialCityStateCountryAddressChunk];

    NSString* address = kRUStringOrNil(addressDict.RFSNFourSquareVenueLocationInfoAddress);
    if (address.length)
    {
        [fullAddress insertString:RUStringWithFormat(@"%@ ",address) atIndex:0];
    }

    id postalCode = addressDict.RFSNFourSquareVenueLocationInfoPostalCode;
    if (postalCode)
    {
        [fullAddress appendFormat:@" %@",postalCode];
    }

    return [NSString stringWithString:fullAddress];
}

@end





@implementation NSDictionary (RFSNFourSquareVenueCategoryInfo)

-(NSString *)RFSNFourSquareVenueCategoryInfoPluralName
{
    return [self objectForKey:@"pluralName"];
}

@end





@implementation NSDictionary (RFSNFourSquareVenueLocationInfo)

-(NSString *)RFSNFourSquareVenueLocationInfoCity
{
    return [self objectForKey:@"city"];
}

-(NSString *)RFSNFourSquareVenueLocationInfoState
{
    return [self objectForKey:@"state"];
}

-(NSString *)RFSNFourSquareVenueLocationInfoCountry
{
    return [self objectForKey:@"country"];
}

-(NSString *)RFSNFourSquareVenueLocationInfoAddress
{
    return [self objectForKey:@"address"];
}

-(id)RFSNFourSquareVenueLocationInfoPostalCode
{
    return [self objectForKey:@"postalCode"];
}

@end
