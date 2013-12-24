//
//  RNNetworkRequest.m
//  Pineapple
//
//  Created by Benjamin Maer on 4/14/13.
//  Copyright (c) 2013 Pineapple. All rights reserved.
//

#import "RNNetworkRequest.h"
#import "RUConstants.h"
#import "RUDLog.h"





@implementation RNNetworkRequest

-(NSString *)description
{
    return RUStringWithFormat(@"%@ _connection: %@\nCurrent data: %@",[super description],_connection,_data);
}

-(void)dealloc
{
    [self cancel];
}

#pragma mark - Getter methods
-(NSURLRequestCachePolicy)cachePolicy
{
    return NSURLRequestReloadIgnoringLocalCacheData;
}

-(NSTimeInterval)timeoutInterval
{
    return 30.0f;
}

#pragma mark - Public methods
-(void)fetchWithUrlRequest:(NSURLRequest*)urlRequest
{
    if (urlRequest)
    {
        _connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO];
        [_connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        [_connection start];
    }
    else
    {
        [NSException raise:NSInvalidArgumentException format:@"must pass a non nil url"];
    }
}

-(void)fetchWithUrl:(NSURL*)url
{
    if (url)
    {
        [self fetchWithUrlRequest:[NSURLRequest requestWithURL:url cachePolicy:self.cachePolicy timeoutInterval:self.timeoutInterval]];
    }
    else
    {
        [NSException raise:NSInvalidArgumentException format:@"must pass a non nil url"];
    }
}

-(void)cancel
{
    if (_connection)
    {
        [_connection cancel];
        _connection = nil;
    }
}

#pragma mark - NSURLConnectionDataDelegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _connection = nil;
    [self didFinishRequestWithResponseData:_data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _connection = nil;
    [self didFailRequestWithError:error];
}

#pragma mark - Subclass methods
-(void)didFinishRequestWithResponseData:(NSData *)responseData
{
    RU_METHOD_IMPLEMENTATION_NEEDED;
}

-(void)didFailRequestWithError:(NSError*)error
{
    RUDLog(@"%@",error);
    RU_METHOD_IMPLEMENTATION_NEEDED;
}

@end
