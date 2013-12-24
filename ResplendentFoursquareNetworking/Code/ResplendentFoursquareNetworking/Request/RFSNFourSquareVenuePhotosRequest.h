//
//  RFSNFourSquareVenuePhotosRequest.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RFSNFourSquareRequest.h"





@interface RFSNFourSquareVenuePhotosRequest : RFSNFourSquareRequest

@property (nonatomic, readonly) NSString* fourSquareVenueId;

-(void)fetchWithFourSquareVenueId:(NSString*)fourSquareVenueId limit:(NSInteger)limit;

@end
