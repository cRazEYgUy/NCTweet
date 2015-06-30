#define TWEET_IMAGE_LOCATION @"/Library/PreferenceBundles/NCTweet.bundle/NCTweet"
#import <Social/Social.h>

@interface SBBulletinObserverViewController : UIViewController
@end

@interface SBTodayViewController : SBBulletinObserverViewController
@end

SLComposeViewController *shareVC;

%hook SBWidgetHandlingBulletinViewController
-(void)viewDidAppear:(BOOL)arg1{
	%orig;
	UIImage *tweetIcon = [[UIImage imageWithContentsOfFile:TWEET_IMAGE_LOCATION] retain];
	UIButton *tweetButton = [[UIButton buttonWithType: UIButtonTypeCustom] retain];

	[tweetButton setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * .85, ([self view].bounds.size.height - 100), 22, 22)];
	[tweetButton setBackgroundImage:tweetIcon forState:UIControlStateNormal];
	[tweetButton addTarget:self action:@selector(tweetSP:) forControlEvents:UIControlEventTouchDown];

	[[self view] addSubview:tweetButton];
}
%new
-(void)tweetSP:(id)sender{
	shareVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[self presentViewController:shareVC animated:1 completion:nil];
}
%end
