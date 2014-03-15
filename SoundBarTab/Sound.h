//
//  Sound.h
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface Sound : NSObject <AVAudioPlayerDelegate>

@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) AVAudioPlayer* audioPlayer;
@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) NSIndexPath* indexPath;

-(id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer;

@end
