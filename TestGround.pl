#!/usr/bin/perl
use 5.12.4;
use List::MoreUtils qw(any);
no strict "refs";

=for
#our @cell1 = (0,2,4,8);
#our @cell49;

#our $thing = $cell1[1];
#print "hey $thing\n";

my @cells;
foreach my $number (0..80) {

	foreach my $b (0..9){ 			#set vis and subscript as 0
	$cells[$number][$b]=0;
	}
	
	$cells[$number][10] = int ($a / 9); 	#set row by dividing by 9
	$cells[$number][11] = $number % 9;		#set col by mod by 9
										#box number is retrieved by &getbox
}



foreach my $a (0..80){
	our $string = ("cell" . $a);
	our ${$string)[11]=1;
	
	foreach my $b (0..9){ 			#set vis and subscript as 0
	@{$string}[$b]=0;
	}
	
	$string->[10] = int ($a / 9); 	#set row by dividing by 9
}
foreach my $c (0..10){
our $thing = ("cell" . 35);
	print "$cell35[$c]";
}print "\n";
foreach my $c(0..10){
our $thing = ("cell" . 49);
	print "$cell49[$c]"
}


@{$name}[0] = @cell##[]
=cut

our @box1 = (0,1,2,9,10,11,18,19,20);
our @box2 = (3,4,5,12,13,14,21,22,23);
our @box3 = (6,7,8,15,16,17,24,25,26);
our @box4 = (27,28,29,36,37,38,45,46,47);
our @box5 = (30,31,32,39,40,41,48,49,50);
our @box6 = (33,34,35,42,43,44,51,52,53);
our @box7 = (54,55,56,63,64,65,72,73,74);
our @box8 = (57,58,59,66,67,68,75,76,77);
our @box9 = (60,61,62,69,70,71,78,79,80);

sub GetRow{
	my $rownum = int ($_ / 9) + 1;
	return ($rownum);
}

foreach my $i (0..80){
	my $group = &GetRow($i);
	#print " $group $i \n";
}
