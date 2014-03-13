//
//  ViewController.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "SportsSoundViewController.h"
#import "SportsSound.h"


@interface SportsSoundViewController ()
@property(nonatomic, strong) NSMutableArray* baseballSounds;
@property(nonatomic, strong) NSMutableArray* footballSounds;
@end

@implementation SportsSoundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.baseballSounds = [[NSMutableArray alloc]init];
    self.footballSounds = [[NSMutableArray alloc]init];
	[self addSounds];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addSounds
{
    NSError* error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundUrl;
    NSString* soundPath;
    NSString* name;
    SportsSound* baseballSound;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"youreout" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"You're Out!!";
    baseballSound = [[SportsSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:baseballSound];

    soundPath = [[NSBundle mainBundle] pathForResource:@"basehit" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Base Hit!!";
    baseballSound = [[SportsSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:baseballSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"strikethree" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Strike Three!!";
    baseballSound = [[SportsSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:baseballSound];
    
//    soundPath = [[NSBundle mainBundle] pathForResource:@"tackle" ofType:@"mp3"];
//    soundUrl = [NSURL fileURLWithPath:soundPath];
//    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
//    name = @"Tackle!";
//    baseballSound = [[SportsSound alloc] initWithName:name audioPlayer:audioPlayer];
//    [self.footballSounds addObject:baseballSound];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.baseballSounds count] + [self.footballSounds count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  if ([indexPath row] == 0)
  //  {
        static NSString* CellIdentifier=@"Cell1";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[self.baseballSounds objectAtIndex:indexPath.row] name];
        
        return cell;
   // }
//    else
//    {
//        static NSString* CellIdentifier=@"Cell2";
//        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//        cell.textLabel.text = [[self.footballSounds objectAtIndex:indexPath.row] name];
//        
//        return cell;
//    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SportsSound* sound = [self.baseballSounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];

}

@end







































