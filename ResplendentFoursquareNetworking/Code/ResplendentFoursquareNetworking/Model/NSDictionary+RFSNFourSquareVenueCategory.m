//
//  NSDictionary+RFSNFourSquareVenueCategory.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "NSDictionary+RFSNFourSquareVenueCategory.h"





NSString* const kRFSNFourSquareVenueCategoryNSDictionaryCategoriesKey = @"categories";





@implementation NSDictionary (RFSNFourSquareVenueCategory)

-(NSString *)rfsnFourSquareVenueCategoryName
{
    return [self objectForKey:@"name"];
}

-(NSString *)rfsnFourSquareVenueCategoryUid
{
    return [self objectForKey:@"id"];
}

-(NSString *)rfsnFourSquareVenueCategoryPluralName
{
    return [self objectForKey:@"pluralName"];
}

-(NSString *)rfsnFourSquareVenueCategoryShortName
{
    return [self objectForKey:@"shortName"];
}

-(NSArray *)rfsnFourSquareVenueCategoryCategories
{
    return [self objectForKey:kRFSNFourSquareVenueCategoryNSDictionaryCategoriesKey];
}

-(NSDictionary *)rfsnFourSquareVenueCategoryIcon
{
    return [self objectForKey:@"icon"];
}

@end
