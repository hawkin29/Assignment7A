//
//  ViewController.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "CatSoundViewController.h"
#import "CatSound.h"

@interface CatSoundViewController ()
@property(nonatomic, strong) NSMutableArray* sounds;
@end

@implementation CatSoundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sounds = [[NSMutableArray alloc]init];
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
    CatSound* catSound;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-angry" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Angry";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-furious" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Furious";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-meow" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Meow";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-sad" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Sad";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-scared" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Scared";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-squeak" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Squeak";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-whining" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Whining";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sounds count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier=@"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.sounds objectAtIndex:indexPath.row] name];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CatSound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

@end







































