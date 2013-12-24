//
//  RNNetworkResponse.h
//  Pineapple
//
//  Created by Benjamin Maer on 8/11/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import <Foundation/Foundation.h>





@class RNNetworkRequest;





@interface RNNetworkResponse : NSObject

@property (nonatomic, readonly, strong) RNNetworkRequest* request;

@property (nonatomic, readonly, strong) id responseObject;

@property (nonatomic, readonly, strong) NSError* error;

-(id)initWithRequestObject:(RNNetworkRequest*)request responseObject:(id)responseObject;
-(id)initWithRequestObject:(RNNetworkRequest*)request error:(NSError*)error;

@end
