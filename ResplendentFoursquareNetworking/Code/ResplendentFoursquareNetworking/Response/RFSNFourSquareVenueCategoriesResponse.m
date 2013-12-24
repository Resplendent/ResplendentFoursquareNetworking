//
//  RFSNFourSquareVenueCategoriesResponse.m
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareVenueCategoriesResponse.h"

#import "RUConstants.h"





@implementation RFSNFourSquareVenueCategoriesResponse

-(NSArray *)categories
{
    return [[self.responseDictionary objectForKey:@"response"] objectForKey:@"categories"];
}

@end
