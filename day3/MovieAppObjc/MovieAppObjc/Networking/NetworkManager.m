//
//  NetworkManager.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import "NetworkManager.h"
#import "MoviesResponse.h"

@implementation NetworkManager

+ (instancetype) shared {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)getMoviesFromURL: (NSString*)urlString completion: (void (^)(NSArray*))completion {
    NSURL* url = [[NSURL alloc] initWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary* dictionary = object;
                MoviesResponse* response = [[MoviesResponse alloc] initFromDictionary:dictionary];
                NSArray* movies = response.result;
                completion(movies);
                return;
            }
        }
        
        
        }] resume];
}

@end
