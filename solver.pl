#!/usr/bin/perl
use 5.12.4;
use List::MoreUtils ':all';
no strict "refs";

=begin profiling stuff

	From the local directory run:
	perl -d:NYTProf sudoku_solver.pl

	Then:
	nytprofhtml

	Then open the index.html file in the new directory

=cut


#
# "quiet" for silent
# "loud" for any messages
# 
our $PrintMode = $ARGV[0];
print("$PrintMode\n");

=for Good Boards
EASY! only needs "Naked Singles"
	000105000140000670080002400063070010900000003010090520007200080026000035000409000

EASY uses "Naked and Hidden Singles"
	000004028406000005100030600000301000087000140000709000002010003900000507670400000

MED needs "Naked Pairs"
	400000938032094100095300240370609004529001673604703090957008300003900400240030709
=cut



our $defaultBoard = '7....1.2.2....67.3..4.5.1...18...9......9......5...38...7.2.6..3.26....9.9.3....7\n';


our @cells;
foreach my $number (0..80) {

	foreach my $b (0..9){ 			#set vis and subscript as 0
		$cells[$number][$b]=0;
	}

	#$cells[$number][10] = int ($number / 9) + 1; 	#set row by dividing by 9
	#$cells[$number][11] = ($number % 9) + 1;		#set col by mod by 9
													#box number is retrieved by &getbox
	$cells[$number][12] = 0; 						# 1 means already pruned

}

sub Combinations{
	my @return;
	foreach my $first ( @{$_[0]} ) {
		foreach my $second ( @{$_[1]} ) {
			push @return, [$first, $second];
		}
	}
	return @return;
}

our @row1 = (0,1,2,3,4,5,6,7,8);
our @row2 = (9,10,11,12,13,14,15,16,17);
our @row3 = (18,19,20,21,22,23,24,25,26);
our @row4 = (27,28,29,30,31,32,33,34,35);
our @row5 = (36,37,38,39,40,41,42,43,44);
our @row6 = (45,46,47,48,49,50,51,52,53);
our @row7 = (54,55,56,57,58,59,60,61,62);
our @row8 = (63,64,65,66,67,68,69,70,71);
our @row9 = (72,73,74,75,76,77,78,79,80);

our @col1 = (0,9,18,27,36,45,54,63,72);
our @col2 = (1,10,19,28,37,46,55,64,73);
our @col3 = (2,11,20,29,38,47,56,65,74);
our @col4 = (3,12,21,30,39,48,57,66,75);
our @col5 = (4,13,22,31,40,49,58,67,76);
our @col6 = (5,14,23,32,41,50,59,68,77);
our @col7 = (6,15,24,33,42,51,60,69,78);
our @col8 = (7,16,25,34,43,52,61,70,79);
our @col9 = (8,17,26,35,44,53,62,71,80);

our @box1 = (0,1,2,9,10,11,18,19,20);
our @box2 = (3,4,5,12,13,14,21,22,23);
our @box3 = (6,7,8,15,16,17,24,25,26);
our @box4 = (27,28,29,36,37,38,45,46,47);
our @box5 = (30,31,32,39,40,41,48,49,50);
our @box6 = (33,34,35,42,43,44,51,52,53);
our @box7 = (54,55,56,63,64,65,72,73,74);
our @box8 = (57,58,59,66,67,68,75,76,77);
our @box9 = (60,61,62,69,70,71,78,79,80);


#Calls for and splits input string into 81 cell arrays
sub change81 {
	print "Gimme your board. 81 characters with either 0s or .s\n";
	our @81 = split //, <STDIN>;# $defaultBoard;#
	foreach my $placevalue (0..80){
		$cells[$placevalue][0] = $81[$placevalue];
	}
}
#Two types of printing the grid
sub printtable(){
	my $val = $_[0];
	print "Values in subscript $val\n";
 	foreach my $i (0..80){
		print "$cells[$i][$val] ";
		print " " if (($i % 9 == 2) || ($i % 9 == 5)) ;
		print "\n" if ($i % 9 == 8) ;  #add a new line every nine cells
		print "\n" if ($i % 27 == 26) ;#add a new line every nine lines
	}
}

sub prettyprint(){
	my $val = $_[0];
	print "\nValues in subscript $val\n";
 	print "|" . ("-" x 7) . "+" . ("-" x 7) . "+" . ("-" x 7) . "|\n";
 	foreach my $i (0..80){
		print "| " if ($i % 9 == 0);
		print "$cells[$i][$val] ";
		print "| " if (($i % 9 == 2) || ($i % 9 == 5));
		print "|\n" if ($i % 9 == 8) ;
		print "|" . ("-" x 7) . "+" . ("-" x 7) . "+" . ("-" x 7) . "|" . "\n" if ($i % 27 == 26);
	}
}

sub changecellfromcl(){		#input cell and value(s), then change grid accordingly
	my (@inputs) = split(" ", <STDIN>);  	#split input into coor pair
	foreach my $input (@inputs) {		
		my ($site1, $value1) = split(",", $input);	#split coor pari(s) into components
		chomp($value1);		#remove extra line
		$cells[$site1][0] = $value1;
	}
}


#apply the visual elements
sub pruneoptions(){
	foreach my $num (0..80) {
		my $modify = ($cells[$num][0]);	
		if ($modify > 0 and $cells[$num][12] == 0){
			# Set the matching options of every member of row, col, box to 1
			#apply { $cells[$_][$modify] = 1; }  @{ ("row" . &GetRow($num)) };
			#apply { $cells[$_][$modify] = 1; }  @{ ("col" . &GetCol($num)) };
			#apply { $cells[$_][$modify] = 1; }  @{ ("box" . &GetBox($num)) };
			&removeFrom($modify, ("row" . &GetRow($num)) );
			&removeFrom($modify, ("col" . &GetCol($num)) );
			&removeFrom($modify, ("box" . &GetBox($num)) );
			# Set all own options to 1
			foreach my $self (1..9) {
				$cells[$num][$self] = 1;
			}
			# Reset option matching the final number
			$cells[$num][$modify] = 0;
			$cells[$num][12] = 1;
		}
	}
}


sub hiddenSingles() {
	my @groupTypes = qw(box row col);
	my @groupNums = (1..9);
	my @groupNames = map {(@$_[0] . @$_[1])} Combinations( \@groupTypes, \@groupNums );
	my $progress;
	foreach my $group (@groupNames){  # 27 group names (ex. "box1" ... "col9") 
		foreach my $position (1..9) { # 9 options for each number
			my @openOptions = grep { !($cells[$_][$position]) } @$group;
			if ( scalar @openOptions == 1){
				my $set = $openOptions[0];
				if ( $cells[ $set ][0] != $position ) { # sets if not already
					$cells[$set][0] = $position;
					logMessage(my $m = "SetBy: $group Cell: $set Val: $position");
					$progress++;
				}
			} elsif (scalar @openOptions == 0) {
				die "Error: No possibilities $group\n";
			}
		}
	}

	if ($progress){
		return 1;
	} else { 
		return 0;
	}
}

sub nakedSingles() {
	my $progress;
	foreach my $num (0..80) {
		if ($cells[$num][0] == 0) {
			my @openOptions = grep { !($cells[$num][$_]) } (1..9); # filter by keeping 0s
			if ( scalar @openOptions == 1){
				$cells[$num][$0] = $openOptions[0];
				logMessage(my $m = "SetVis Cell: $num Val: $cells[$num][0]");
				$progress++;
			}
		}
	}
	
	if ($progress){
		return 1;
	} else {
		return 0;;
	}
}

#infers hard(er) subscript changes
sub pointingPair {
	my @old;
	foreach my $i (0..80){
		foreach my $j (0..9){
			$old[$i][$j] = $cells[$i][$j];
		}
	}
	foreach my $change (1..9) {	#each subscript
		foreach my $box (1..9) {
			my @val;
			my $lala = 0;
			my $look = ("box" . $box);
			foreach my $cellnum (@{$look}){
				if (! ($cells[$cellnum][$change])){
					$val[$lala] = $cellnum;
					$lala++;
				}
			}
			# "$#val" returns highest index of @val
			if ($#val == 1){
				my $cell = $val[0];
				my $name = $val[1];
				my $real = "cell" . $cell;
				my $ral = "cell" . $name;
				logMessage(my $m = "$real $ral ");
				if ( &GetRow($cell) == &GetRow($name) ){	#for two in a row
					logMessage(my $m = "same row: GetRow($cell)");
					apply { $cells[$_][$change] = 1; }  @{ ("row" . &GetRow($cell)) };
				}
				if ( &GetCol($cell) == &GetCol($name) ){	#for two in a col
					logMessage(my $m = "same column: GetCol($cell)");
					apply { $cells[$_][$change] = 1; }  @{ ("col" . &GetCol($cell)) };
				}
				#set the pointingPair cells back to open
				$cells[$cell][$change] = 0;
				$cells[$name][$change] = 0;
				logMessage(my $m = "pointingPair $real $ral [$change]");
			}
		}
	}
	my $dif;
	foreach my $i (0..80){		
		foreach my $j (0..9){
			if ($old[$i][$j] != $cells[$i][$j]) {
				$dif++;
			}
		}
	}
	if ($dif){
		return 1;
	} else {
		return 0;
	}
}

sub nakedPairs {
	# scan grid for two naked in a cell
	# see if the cells with two naked share a group
	my @old;
	foreach my $i (0..80){
		foreach my $j (0..9){
			$old[$i][$j] = $cells[$i][$j];
		}
	}

	my %pairsPossible = {};
	foreach my $num (0..80) {
		my @openOptions = grep { !($cells[$num][$_]) } (1..9); # filter by keeping 0s
		if (scalar @openOptions == 2){
			$pairsPossible{$num} = \@openOptions;
		}
	}

	foreach my $first (keys %pairsPossible) {
		foreach my $second (keys %pairsPossible) {
			if ($first != $second){
				if (@{$pairsPossible{$first}} ~~ @{$pairsPossible{$second}}) {
					if (my $hold = sharedGroup($first, $second)) {
						foreach my $option (@{$pairsPossible{$first}}) {
							foreach my $group ( @{$hold} ){
								removeFrom($option, $group);
								# return the options to the pair
								$cells[$first][$option] = 0;
								$cells[$second][$option] = 0;
							}
						}
					}
				}
			}
		}
		my @arr = @{$pairsPossible{$first}};
	}

	my $dif;
	foreach my $i (0..80){		
		foreach my $j (0..9){
			if ($old[$i][$j] != $cells[$i][$j]){
				$dif++;
			}
		}
	}
	if ($dif){
		return 1;
	} else {
		return 0;
	}	

}

sub removeFrom {
	my ($option, $group) = @_;
	apply { $cells[$_][$option] = 1; }  @{ $group };
}

sub sharedGroup {
	my ($first, $second) = @_;
	my @inCommon = ();
	if (&GetRow($first) == &GetRow($second)) {
		push @inCommon, ("row" . &GetRow($first))
	}
	if (&GetCol($first) == &GetCol($second)) {
		push @inCommon, ("col" . &GetCol($first))
	}
	if (&GetBox($first) == &GetBox($second)) {
		push @inCommon, ("box" . &GetBox($first))
	}
	if (scalar @inCommon > 0){
		return \@inCommon;
	} else {
		return 0;
	}
	
}

#other
sub GetRow {
	return (int ($_[0] / 9) + 1);
}
sub GetCol {
	return (($_[0] % 9) + 1);
}
sub GetBox {
	my $test = $_[0];
	foreach my $t (1..9){
		if (grep {$test == $_} @{"box" . $t}) {
			return $t;
		}
	}
}

# My print method to allow for quiet and debug modes
sub logMessage {
	if ($PrintMode eq "loud"){
		print "@_\n";
	}
}

sub working {
	while ( &nakedSingles or &hiddenSingles or &nakedPairs or &pointingPair) {
		&pruneoptions;
	}
}

sub print81{
	my $counter;
	foreach my $i (0..80){
		print $cells[$i][0];
		if ($cells[$i][0]){
			$counter++;
		}
	}
	print "\n$counter\n";
}


####################################
## Some redundancy of &nakedSingles ##
####################################
&change81;
&printtable(0);
&pruneoptions;
&working;
&prettyprint(0);
=begin comment
print "Subscript (S) or Edit (E)?";
my $input = <STDIN>;
chomp($input);
print ">>$input<<\n";
if ($input eq "S"){
	print "Which subscripts? start,end\n";
	(my $start, my $end) = split(/,/, <STDIN>);
	chop($end);
	&display($start,$end);
}elsif ($input eq "E"){
	my $approval = "N";
	while (!($approval eq "Y")){
		print "Which cell(s), value(s)?\n";
		&changecellfromcl;
		&prettyprint;
		print "Is this good? Y/N ";
		$approval = <STDIN>;
		chomp ($approval);
	}
	print "Run this? ";
	my $run = <STDIN>;
	chomp($run);
	if ($run eq "Y"){
		&working;
		&prettyprint(0);
	}
	print "Goodbye.\n";
	&print81;
}else{
	print "Goodbye.\n";
	&print81;
}	
=cut	