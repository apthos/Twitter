//
//  TweetViewController.m
//  twitter
//
//  Created by David Lara on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@interface TweetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

- (IBAction)onReplyPress:(id)sender;
- (IBAction)onRetweetPress:(id)sender;
- (IBAction)onFavoritePress:(id)sender;

@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateWithTweet:self.tweet];
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)updateWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
    
    self.screenNameLabel.text = [NSString stringWithFormat:(@"@%@"), self.tweet.user.screenName];
    self.nameLabel.text = self.tweet.user.name;
    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    self.favoriteLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.retweetLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    
    [self.favoriteButton setSelected:self.tweet.favorited];
    [self.retweetButton setSelected:self.tweet.retweeted];
    
    NSString *baseURLString = self.tweet.user.profileImage;
    NSURL *profileImageURL = [NSURL URLWithString:baseURLString];
    self.profileView.image = nil;
    [self.profileView setImageWithURL:profileImageURL];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onFavoritePress:(id)sender {
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
             NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            self.tweet.favorited = YES;
            self.tweet.favoriteCount += 1;

            [self updateWithTweet:self.tweet];
        }
    }];
}

- (IBAction)onRetweetPress:(id)sender {
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if (error) {
            NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
        }
        else {
            self.tweet.retweeted = YES;
            self.tweet.retweetCount += 1;

            [self updateWithTweet:self.tweet];
        }
    }];
}

- (IBAction)onReplyPress:(id)sender {
}

@end
