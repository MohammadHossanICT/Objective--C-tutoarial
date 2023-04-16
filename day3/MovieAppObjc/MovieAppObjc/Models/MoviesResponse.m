//
//  MoviesResponse.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import "MoviesResponse.h"
#import "Movie.h"

@implementation MoviesResponse

- (instancetype)initFromDictionary: (NSDictionary*)dictionary {
    self = [super init];
    
    NSMutableArray* movies = [[NSMutableArray alloc] init];
    NSArray* jsonResults = [dictionary objectForKey:@"results"];
    for (NSDictionary* result in jsonResults) {
        Movie* movie = [[Movie alloc] initFromDictionary:result];
        [movies addObject:movie];
    }
    
    self.result = movies;
    return self;
}

@end
