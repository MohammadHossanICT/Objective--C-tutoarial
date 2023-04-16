//
//  MoviesResponse.h
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoviesResponse : NSObject

@property (nonatomic, strong) NSArray* result;
- (instancetype)initFromDictionary: (NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
