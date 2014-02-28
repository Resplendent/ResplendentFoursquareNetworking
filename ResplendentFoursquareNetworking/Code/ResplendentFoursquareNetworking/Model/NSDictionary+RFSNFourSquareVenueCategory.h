//
//  NSDictionary+RFSNFourSquareVenueCategory.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import <Foundation/Foundation.h>





extern NSString* const kRFSNFourSquareVenueCategoryNSDictionaryCategoriesKey;





@interface NSDictionary (RFSNFourSquareVenueCategory)

@property (nonatomic, readonly) NSString* rfsnFourSquareVenueCategoryName;
@property (nonatomic, readonly) NSString* rfsnFourSquareVenueCategoryUid;
@property (nonatomic, readonly) NSString* rfsnFourSquareVenueCategoryPluralName;
@property (nonatomic, readonly) NSString* rfsnFourSquareVenueCategoryShortName;

@property (nonatomic, readonly) NSArray* rfsnFourSquareVenueCategoryCategories;
@property (nonatomic, readonly) NSDictionary* rfsnFourSquareVenueCategoryIcon;

@end
