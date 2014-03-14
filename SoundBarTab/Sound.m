//
//  Sound.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "Sound.h"

@implementation Sound


-(id)init
{
    return [self initWithName:@"" audioPlayer:[[AVAudioPlayer alloc]init]];
}


-(id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer
{
    self = [super init];
    if (self)
    {
        _name = name;
        _audioPlayer = audioPlayer;
        self.audioPlayer.delegate = self;
    }
    return self;
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.tableView deselectRowAtIndexPath:self.indexPath animated:YES];
}

@end
