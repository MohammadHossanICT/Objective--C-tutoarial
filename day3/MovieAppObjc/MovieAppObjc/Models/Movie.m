//
//  Movie.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initFromDictionary: (NSDictionary*)dictionary {
    self = [super init];
    self.identifier = [[dictionary valueForKey:@"id"] integerValue];
    self.originalTitle = [dictionary valueForKey:@"original_title"];
    self.posterPath = [dictionary valueForKey:@"poster_path"];
    self.overview = [dictionary valueForKey:@"overview"];
    return self;
}

@end
