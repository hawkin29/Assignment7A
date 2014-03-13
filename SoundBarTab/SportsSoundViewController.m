//
//  ViewController.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "SportsSoundViewController.h"
#import "Sound.h"


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
    Sound* sound;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"youreout" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"You're Out!!";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:sound];

    soundPath = [[NSBundle mainBundle] pathForResource:@"basehit" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Base Hit!!";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"strikethree" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Strike Three!!";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.baseballSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"tackle" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Tackle!";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.footballSounds addObject:sound];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
       return [self.baseballSounds count];
    }
    else
    {
        return [self.footballSounds count];
    }
   
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString* CellIdentifier=@"Cell1";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[self.baseballSounds objectAtIndex:indexPath.row] name];
        
        return cell;
    }
    else
    {
        static NSString* CellIdentifier=@"Cell2";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[self.footballSounds objectAtIndex:indexPath.row] name];
        
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Sound* sound = [self.baseballSounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
    {
        return @"Baseball!!";
    }
    else
    {
        return @"Football!!";
    }
}



//(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//    if (section == 0)
//    {
//        
//    }
//}

@end







































