//
//  NetworkManager.h
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (instancetype) shared;

- (void)getMoviesFromURL: (NSString*)urlString completion: (void (^)(NSArray*))completion ;

@end

NS_ASSUME_NONNULL_END
