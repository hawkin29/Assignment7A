//
//  CatSound.h
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface SportsSound : NSObject

@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) AVAudioPlayer* audioPlayer;

-(id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer;

@end
