//
//  CatSound.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "CatSound.h"

@implementation CatSound


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
    }
    return self;
}


@end
