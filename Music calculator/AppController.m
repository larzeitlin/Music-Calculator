
#import "AppController.h"
#import <math.h>

@implementation AppController

-(void)awakeFromNib
{
    [octSlider setIntValue:1];
    [octLabel setIntValue:[octSlider intValue]];
    [noteSelector setSelected:YES forSegment:0];
    [MIDIVal setIntValue:12];
    [tuningField setFloatValue:440.0];
    [self updateFreq];
    [self updateBPM];

}
- (IBAction)octSliderChange:(id)sender
{
    [octLabel setIntValue:[octSlider intValue]];
    [self updateMIDI];
    [self updateFreq];
    [self updateBPM];
}

- (IBAction)noteChange:(id)sender {
    [self updateMIDI];
    [self updateFreq];
    [self updateBPM];
}

- (IBAction)MIDIChange:(id)sender {
    [self updateOct];
    [self updateNote];
    [self updateFreq];
    [self updateBPM];
    
}

- (IBAction)tuningChange:(id)sender
{
    [self updateFreq];
    [self updateBPM];
}

- (IBAction)BPMTimesTwo:(id)sender
{
    [BPMField setFloatValue:[BPMField floatValue] * 2];
}

- (IBAction)BPMDivTwo:(id)sender
{
    [BPMField setFloatValue:[BPMField floatValue] / 2];
}

- (void)updateOct
{
    [octSlider setIntValue:([MIDIVal intValue]/12)];
    [octLabel setIntValue:(([MIDIVal intValue]/12))];
}

- (void)updateNote
{
    [noteSelector setSelected:YES forSegment:([MIDIVal intValue] % 12)];
}
- (void)updateMIDI
{
    [MIDIVal setIntValue:([noteSelector selectedSegment] + [octSlider intValue]*12)];
}
- (void)updateFreq
{
    [freqField setFloatValue:(pow(2.0, (([MIDIVal intValue] - 69.0)/12.0)) * [tuningField floatValue])];
}

- (void)updateBPM
{
    [BPMField setFloatValue:( [freqField floatValue] * 60 )];
}

@end
