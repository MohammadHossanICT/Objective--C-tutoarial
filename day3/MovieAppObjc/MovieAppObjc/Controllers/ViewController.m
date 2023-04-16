//
//  ViewController.m
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/24/22.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "Movie.h"
#import "MovieObjcCell.h"
#import "MovieAppObjc-Swift.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray<Movie*>* movies;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NetworkManagerSwift* manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    [self fetchMovies];
    
}

- (void) setUpUI {
    UIColor* white = [UIColor whiteColor];
    [self.view setBackgroundColor:white];
    
    UITableView* table = [[UITableView alloc] init];
    table.translatesAutoresizingMaskIntoConstraints = false;
    [table registerClass:[MovieObjcCell self] forCellReuseIdentifier:@"cellID"];
    [table registerClass:[MovieSwiftCell self] forCellReuseIdentifier:[MovieSwiftCell identifier]];
    [table setDataSource:self];
    [table setDelegate:self];
    
    [self.view addSubview:table];
    
    UILayoutGuide* safeArea = self.view.safeAreaLayoutGuide;
    [[table.topAnchor constraintEqualToAnchor:safeArea.topAnchor] setActive:true];
    [[table.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor] setActive:true];
    [[table.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor] setActive:true];
    [[table.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor] setActive:true];
    
    self.tableView = table;
}

- (void)fetchMovies {
    NSString* url = @"https://api.themoviedb.org/3/movie/popular?language=en-US&page=3&api_key=6622998c4ceac172a976a1136b204df4";
    
    self.manager = [[NetworkManagerSwift alloc] init];
    [self.manager getMovieFrom:url completion:^(NSArray<Movie *> * _Nonnull movies) {
        __weak typeof(self) weakSelf = self;
        weakSelf.movies = movies;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    }];
    
    
//    [[NetworkManager shared] getMoviesFromURL:url completion:^(NSArray * _Nonnull movies) {
//
//        __weak typeof(self) weakSelf = self;
//        weakSelf.movies = movies;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf.tableView reloadData];
//        });
//
//
//    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     //Objc Class
     MovieObjcCell* cell = (MovieObjcCell*)[tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
     Movie* movie = [self.movies objectAtIndex:indexPath.row];
     [cell configureCell:movie.originalTitle overview:movie.overview];
     return cell;
     */
    
    // Swift class
    MovieSwiftCell* cell = (MovieSwiftCell*)[tableView dequeueReusableCellWithIdentifier:[MovieSwiftCell identifier] forIndexPath:indexPath];
    Movie* movie = [self.movies objectAtIndex:indexPath.row];
    [cell configureCellWithTitle:movie.originalTitle overview:movie.overview];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
