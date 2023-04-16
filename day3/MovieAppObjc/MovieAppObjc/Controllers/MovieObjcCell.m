//
//  MovieObjcCell.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

#import "MovieObjcCell.h"

@interface MovieObjcCell()

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UILabel* overviewLabel;

@end

@implementation MovieObjcCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setUpUI];
    return self;
}

-(void)setUpUI {
    UILabel* title = [[UILabel alloc] init];
    title.translatesAutoresizingMaskIntoConstraints = false;
    [title setNumberOfLines:0];
    [title setTextAlignment:NSTextAlignmentLeft];
    self.titleLabel = title;
    
    UILabel* overview = [[UILabel alloc] init];
    overview.translatesAutoresizingMaskIntoConstraints = false;
    [overview setNumberOfLines:0];
    [overview setTextAlignment:NSTextAlignmentLeft];
    self.overviewLabel = overview;
    
    [self.contentView addSubview:title];
    [self.contentView addSubview:overview];
    
    UILayoutGuide* safeArea = self.contentView.safeAreaLayoutGuide;
    
    [[title.topAnchor constraintEqualToAnchor:safeArea.topAnchor] setActive:true];
    [[title.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor] setActive:true];
    [[title.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor] setActive:true];
    
    [[overview.topAnchor constraintEqualToAnchor:title.bottomAnchor] setActive:true];
    [[overview.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor] setActive:true];
    [[overview.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor] setActive:true];
    [[overview.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor] setActive:true];
}

-(void) configureCell:(NSString*)title overview:(NSString*)overview {
    self.titleLabel.text = title;
    self.overviewLabel.text = overview;
}

@end
