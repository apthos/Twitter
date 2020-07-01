//
//  TweetCell.m
//  twitter
//
//  Created by David Lara on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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

- (void)updateWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
    
    self.screenNameLabel.text = self.tweet.user.screenName;
    self.nameLabel.text = self.tweet.user.name;
    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    self.retweetsLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoritesLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    
    [self.favoriteButton setSelected:self.tweet.favorited];
    [self.retweetButton setSelected:self.tweet.retweeted];
    
    NSString *baseURLString = self.tweet.user.profileImage;
    NSURL *profileImageURL = [NSURL URLWithString:baseURLString];
    self.profileView.image = nil;
    [self.profileView setImageWithURL:profileImageURL];
    
}

@end
