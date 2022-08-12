#! /usr/bin/perl
# 
# A script born out of a discussion thread:
# http://unix.stackexchange.com/questions/88159/only-output-most-recent-10-or-n-lines-of-a-lengthy-command-output
#
# scroller.pl <offset> <size> <headerfile>
# Create a scroll window of <size> lines long at row <offset>, displaying a <headerfile> before this
# window. 
#
# <offset>, <size> and <headerfile> are all optional.
# <offset> and <size> can be set to '-' to make it use the whole window size.
#
# The scroll window displays everything passed on STDIN.
#
# Examples:
#
#    tar -zcvf mybackup.tgz / | scroller.pl                 # scroll the tar in the whole term screen
#    tar -zcvf mybackup.tgz / | scroller.pl 5 18            # scroll at line 5 an 18 line scroll window
#    tar -zcvf mybackup.tgz / | scroller.pl - - headerfile  # print a header file and scroll below it

use strict;
use warnings;
use Curses;
use Text::Wrap;

# exit curses mode nicely on Ctrl-C
$SIG{INT} = sub { endwin; exit(0); };  

my $fsize = 0;
my $a = 0;
my $s; 

# read in a file if set on argv[2]
my $file = $ARGV[2];
if(defined $file) {
    local($/) = undef;
    open(TMP, "<$file") or die "Failed to open file: $file\n";
    $file = <TMP>;
    close(TMP);

    # work out the number of lines
    $fsize = map $_, $file =~ /\n/gs;
    $fsize++;
}

# initialize curses
initscr();

# create and output the file window if a file was provided
if($file) {
    $s = newwin($fsize, COLS(), 0, 1) if($file);
    if(!defined $s) { endwin; die "Failed to create file window!" }
    $s->addstr(0,0,$file);
    $s->refresh();

# else set where to wrap (used when no file is provided to stop scroll buffer spamming)
} else {
    $Text::Wrap::columns = COLS()-1;
}


# use the first argument for the offset (what line to start the scrolling window at)
# or calc the size of the offset taking into consideration the potential "header file"
my $offset;
if($ARGV[0] && $ARGV[0] ne '-') {
    $offset = $ARGV[0];

    if($offset <= $fsize) {
        endwin;
        die "Offset is smaller than the length of the file provided";
    }   
} else {
    $offset = ($fsize ? $fsize : 1); 
}   

# Use the 2nd argument for the length of the scroll window, or calculate it
# how many rows long is this window?
my $rows;
if ($ARGV[1] and $ARGV[1] ne '-') {
    $rows = $ARGV[1]+1;
} else {
    $rows = LINES() - $offset;
}   

# create the window and set scrolling to true
my $w = newwin($rows, COLS(), $offset, 1); 
if(!defined $w) { endwin; die "Failed to create window!" }
$w->scrollok(1);

# process the input
while(<STDIN>) {
    my $line = $_;

    $a++ if($a < $rows-1);

    # if a file is defined, the window above will stop the scroll buffer of the terminal getting
    # filled with long lines, just add the string and refresh
    if($file) {
        $w->addstr($a, 0, $line);
        $w->refresh();

    # else we have to split the lines and add each line individually
    } else {
        foreach( split(/\n/, wrap('', '', $line)) ) {
            $w->addstr($a, 0, "$_\n");
            $w->refresh();
        }
    }
}

# all done send the endwin sequence
endwin;