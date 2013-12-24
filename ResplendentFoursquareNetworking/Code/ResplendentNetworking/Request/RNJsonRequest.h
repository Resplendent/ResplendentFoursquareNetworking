//
//  RNJsonRequest.h
//  Pineapple
//
//  Created by Benjamin Maer on 4/14/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RNNetworkRequest.h"

@interface RNJsonRequest : RNNetworkRequest

-(void)didFinishRequestWithJsonResponse:(id)responseJson;
-(void)didFinishRequestWithJsonParsingError:(NSError*)error;

@end
