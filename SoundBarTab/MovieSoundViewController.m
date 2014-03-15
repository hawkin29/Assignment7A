//
//  ViewController.m
//  Assignment7
//
//  Created by Kevin Hawkinson on 3/6/14.
//  Copyright (c) 2014 Kevin Hawkinson. All rights reserved.
//

#import "MovieSoundViewController.h"
#import "Sound.h"


@interface MovieSoundViewController ()
@property(nonatomic, strong) NSMutableArray* snatchSounds;
@property(nonatomic, strong) NSMutableArray* idiocracySounds;
@property(nonatomic, strong) Sound* sound;
@end

@implementation MovieSoundViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.snatchSounds = [[NSMutableArray alloc]init];
    self.idiocracySounds = [[NSMutableArray alloc]init];
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
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"borisTheBulletDodger" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Boris";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.snatchSounds addObject:sound];

    soundPath = [[NSBundle mainBundle] pathForResource:@"noWheels" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Caravan";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.snatchSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"periwinkleBlue" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Periwinkle Blue";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.snatchSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"stayDown" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Stay Down";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.snatchSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"sweetEnough" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"I'm Sweet Enough";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.snatchSounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"welcomeToCostco" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Welcome To Costco";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.idiocracySounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"carlsJr" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Carls Jr.";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.idiocracySounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"iLikeMoney" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"I Like Money";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.idiocracySounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"theDoctor" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Doctor's Analysis";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.idiocracySounds addObject:sound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"starbucks" ofType:@"mp3"];
    soundUrl = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
    name = @"Starbucks";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.idiocracySounds addObject:sound];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
       return [self.snatchSounds count];
    }
    else
    {
        return [self.idiocracySounds count];
    }
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString* CellIdentifier=@"Cell1";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[self.snatchSounds objectAtIndex:indexPath.row] name];
        cell.backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
        cell.textLabel.textColor = [UIColor blackColor];
        return cell;
    }
    else
    {
        static NSString* CellIdentifier=@"Cell2";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [[self.idiocracySounds objectAtIndex:indexPath.row] name];
        cell.backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        Sound* sound = [self.snatchSounds objectAtIndex:indexPath.row];
        sound.tableView = tableView;
        sound.indexPath = indexPath;
        [sound.audioPlayer prepareToPlay];
        [sound.audioPlayer play];
    }
    else
    {
        Sound* sound  = [self.idiocracySounds objectAtIndex:indexPath.row];
        sound.tableView = tableView;
        sound.indexPath = indexPath;
        [sound.audioPlayer prepareToPlay];
        [sound.audioPlayer play];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] init];
    
    if (section == 0)
    {
        
        label.text = @"    SNATCH";
        label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont boldSystemFontOfSize:10];
        return label;

    }
    else
    {
        label.text = @"    IDIOCRACY";
        label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont boldSystemFontOfSize:10];
        return label;
    }
}

@end