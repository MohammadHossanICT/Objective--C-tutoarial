//
//  Movie.h
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, strong) NSString* originalTitle;
@property (nonatomic, strong) NSString* posterPath;
@property (nonatomic, strong) NSString* overview;

- (instancetype)initFromDictionary: (NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
