//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *tweets;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UITableView *tweetsTableView;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tweetsTableView.dataSource = self;
    self.tweetsTableView.delegate = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTimeline) forControlEvents:UIControlEventValueChanged];
    [self.tweetsTableView insertSubview:self.refreshControl atIndex:0];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self fetchTimeline];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    
    cell.tweet = tweet;
    cell.screenNameLabel.text = tweet.user.screenName;
    cell.nameLabel.text = tweet.user.name;
    cell.dateLabel.text = tweet.createdAtString;
    cell.tweetTextLabel.text = tweet.text;
    cell.retweetsLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    cell.favoritesLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    
    NSString *baseURLString = tweet.user.profileImage;

    NSURL *profileImageURL = [NSURL URLWithString:baseURLString];
    cell.profileView.image = nil;
    [cell.profileView setImageWithURL:profileImageURL];
    
    return cell;
}

- (void)fetchTimeline {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = (NSMutableArray *) tweets;
            [self.tweetsTableView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
            
        }
        [self.refreshControl endRefreshing];
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
