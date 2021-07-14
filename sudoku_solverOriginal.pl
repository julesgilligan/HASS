#!/usr/bin/perl
use 5.12.4;
no strict "refs";
# 0=vis, 1=1-9, 10=row, 11=col, 12=box, 13,14=undef
our @cell0 = (0,0,0,0,0,0,0,0,0,0,1,1,1,0,0);
our @cell1 = (0,0,0,0,0,0,0,0,0,0,1,2,1,0,0);
our @cell2 = (0,0,0,0,0,0,0,0,0,0,1,3,1,0,0);
our @cell3 = (0,0,0,0,0,0,0,0,0,0,1,4,2,0,0);
our @cell4 = (0,0,0,0,0,0,0,0,0,0,1,5,2,0,0);
our @cell5 = (0,0,0,0,0,0,0,0,0,0,1,6,2,0,0);
our @cell6 = (0,0,0,0,0,0,0,0,0,0,1,7,3,0,0);
our @cell7 = (0,0,0,0,0,0,0,0,0,0,1,8,3,0,0);
our @cell8 = (0,0,0,0,0,0,0,0,0,0,1,9,3,0,0);
our @cell9 = (0,0,0,0,0,0,0,0,0,0,2,1,1,0,0);
our @cell10 = (0,0,0,0,0,0,0,0,0,0,2,2,1,0,0);
our @cell11 = (0,0,0,0,0,0,0,0,0,0,2,3,1,0,0);
our @cell12 = (0,0,0,0,0,0,0,0,0,0,2,4,2,0,0);
our @cell13 = (0,0,0,0,0,0,0,0,0,0,2,5,2,0,0);
our @cell14 = (0,0,0,0,0,0,0,0,0,0,2,6,2,0,0);
our @cell15 = (0,0,0,0,0,0,0,0,0,0,2,7,3,0,0);
our @cell16 = (0,0,0,0,0,0,0,0,0,0,2,8,3,0,0);
our @cell17 = (0,0,0,0,0,0,0,0,0,0,2,9,3,0,0);
our @cell18 = (0,0,0,0,0,0,0,0,0,0,3,1,1,0,0);
our @cell19 = (0,0,0,0,0,0,0,0,0,0,3,2,1,0,0);
our @cell20 = (0,0,0,0,0,0,0,0,0,0,3,3,1,0,0);
our @cell21 = (0,0,0,0,0,0,0,0,0,0,3,4,2,0,0);
our @cell22 = (0,0,0,0,0,0,0,0,0,0,3,5,2,0,0);
our @cell23 = (0,0,0,0,0,0,0,0,0,0,3,6,2,0,0);
our @cell24 = (0,0,0,0,0,0,0,0,0,0,3,7,3,0,0);
our @cell25 = (0,0,0,0,0,0,0,0,0,0,3,8,3,0,0);
our @cell26 = (0,0,0,0,0,0,0,0,0,0,3,9,3,0,0);
our @cell27 = (0,0,0,0,0,0,0,0,0,0,4,1,4,0,0);
our @cell28 = (0,0,0,0,0,0,0,0,0,0,4,2,4,0,0);
our @cell29 = (0,0,0,0,0,0,0,0,0,0,4,3,4,0,0);
our @cell30 = (0,0,0,0,0,0,0,0,0,0,4,4,5,0,0);
our @cell31 = (0,0,0,0,0,0,0,0,0,0,4,5,5,0,0);
our @cell32 = (0,0,0,0,0,0,0,0,0,0,4,6,5,0,0);
our @cell33 = (0,0,0,0,0,0,0,0,0,0,4,7,6,0,0);
our @cell34 = (0,0,0,0,0,0,0,0,0,0,4,8,6,0,0);
our @cell35 = (0,0,0,0,0,0,0,0,0,0,4,9,6,0,0);
our @cell36 = (0,0,0,0,0,0,0,0,0,0,5,1,4,0,0);
our @cell37 = (0,0,0,0,0,0,0,0,0,0,5,2,4,0,0);
our @cell38 = (0,0,0,0,0,0,0,0,0,0,5,3,4,0,0);
our @cell39 = (0,0,0,0,0,0,0,0,0,0,5,4,5,0,0);
our @cell40 = (0,0,0,0,0,0,0,0,0,0,5,5,5,0,0);
our @cell41 = (0,0,0,0,0,0,0,0,0,0,5,6,5,0,0);
our @cell42 = (0,0,0,0,0,0,0,0,0,0,5,7,6,0,0);
our @cell43 = (0,0,0,0,0,0,0,0,0,0,5,8,6,0,0);
our @cell44 = (0,0,0,0,0,0,0,0,0,0,5,9,6,0,0);
our @cell45 = (0,0,0,0,0,0,0,0,0,0,6,1,4,0,0);
our @cell46 = (0,0,0,0,0,0,0,0,0,0,6,2,4,0,0);
our @cell47 = (0,0,0,0,0,0,0,0,0,0,6,3,4,0,0);
our @cell48 = (0,0,0,0,0,0,0,0,0,0,6,4,5,0,0);
our @cell49 = (0,0,0,0,0,0,0,0,0,0,6,5,5,0,0);
our @cell50 = (0,0,0,0,0,0,0,0,0,0,6,6,5,0,0);
our @cell51 = (0,0,0,0,0,0,0,0,0,0,6,7,6,0,0);
our @cell52 = (0,0,0,0,0,0,0,0,0,0,6,8,6,0,0);
our @cell53 = (0,0,0,0,0,0,0,0,0,0,6,9,6,0,0);
our @cell54 = (0,0,0,0,0,0,0,0,0,0,7,1,7,0,0);
our @cell55 = (0,0,0,0,0,0,0,0,0,0,7,2,7,0,0);
our @cell56 = (0,0,0,0,0,0,0,0,0,0,7,3,7,0,0);
our @cell57 = (0,0,0,0,0,0,0,0,0,0,7,4,8,0,0);
our @cell58 = (0,0,0,0,0,0,0,0,0,0,7,5,8,0,0);
our @cell59 = (0,0,0,0,0,0,0,0,0,0,7,6,8,0,0);
our @cell60 = (0,0,0,0,0,0,0,0,0,0,7,7,9,0,0);
our @cell61 = (0,0,0,0,0,0,0,0,0,0,7,8,9,0,0);
our @cell62 = (0,0,0,0,0,0,0,0,0,0,7,9,9,0,0);
our @cell63 = (0,0,0,0,0,0,0,0,0,0,8,1,7,0,0);
our @cell64 = (0,0,0,0,0,0,0,0,0,0,8,2,7,0,0);
our @cell65 = (0,0,0,0,0,0,0,0,0,0,8,3,7,0,0);
our @cell66 = (0,0,0,0,0,0,0,0,0,0,8,4,8,0,0);
our @cell67 = (0,0,0,0,0,0,0,0,0,0,8,5,8,0,0);
our @cell68 = (0,0,0,0,0,0,0,0,0,0,8,6,8,0,0);
our @cell69 = (0,0,0,0,0,0,0,0,0,0,8,7,9,0,0);
our @cell70 = (0,0,0,0,0,0,0,0,0,0,8,8,9,0,0);
our @cell71 = (0,0,0,0,0,0,0,0,0,0,8,9,9,0,0);
our @cell72 = (0,0,0,0,0,0,0,0,0,0,9,1,7,0,0);
our @cell73 = (0,0,0,0,0,0,0,0,0,0,9,2,7,0,0);
our @cell74 = (0,0,0,0,0,0,0,0,0,0,9,3,7,0,0);
our @cell75 = (0,0,0,0,0,0,0,0,0,0,9,4,8,0,0);
our @cell76 = (0,0,0,0,0,0,0,0,0,0,9,5,8,0,0);
our @cell77 = (0,0,0,0,0,0,0,0,0,0,9,6,8,0,0);
our @cell78 = (0,0,0,0,0,0,0,0,0,0,9,7,9,0,0);
our @cell79 = (0,0,0,0,0,0,0,0,0,0,9,8,9,0,0);
our @cell80 = (0,0,0,0,0,0,0,0,0,0,9,9,9,0,0);

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

our @all = (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,
	29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57
	,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80);


#Calls for and splits input string into 81 cell arrays
sub change81 {
	our @81 = split //, <>;
	foreach my $placevalue (0..80){
		my $name = "cell" . $placevalue;
		@{$name}[0] = $81[$placevalue];
		#$cells[$hold][0] = $81[$hold];
	}
}
#Two types of printing the grid
sub printtable(){
	my $val = $_[0];
	print "Values in subscript $val\n";
	#for (my $i = 1, $i < 82, $i++){
 	foreach my $i (0..80){
		my $com = ("cell" . $i);
		print "$com->[$val] ";
		if ($i % 9 == 2){
			print " ";
		}
		if ($i % 9 == 5){
			print " ";
		}
		if ($i % 9 == 8){  #add a new line every nine cells, remove if diff occ;
			print "\n";
			if ($i % 27 == 26){	 #add a new line every nine lines, remove if diff occ;
				print "\n";
			}
		}
	}
}
sub prettyprint(){
	my $val = $_[0];
	print "Values in subscript $val\n";
	#for (my $i = 1, $i < 81, $i++){
 	print "|" . ("-" x 7) . "+" . ("-" x 7) . "+" . ("-" x 7) . "|\n";
 	foreach my $i (0..80){
		my $com = ("cell" . $i);
		if ($com->[11] == 1){
			print "| ";
		}
		print "$com->[$val] ";
		if ($i % 9 == 2){
			print "| ";
		}
		if ($i % 9 == 5){
			print "| ";
		}
		if ($i % 9 == 8){
			print "|\n";
			if ($i % 27 == 26){
				my $dashes = "|" . ("-" x 7) . "+" . ("-" x 7) . "+" . ("-" x 7) . "|";
				print "$dashes\n";
			}
		}
	}
}

sub changecellfromcl(){		#input cell and value(s), then change grid accordingly
	my (@inputs) = split(" ", <STDIN>);  	#split input into coor pair
	foreach my $input (@inputs) {		
		my ($site1, $value1) = split(",", $input);	#split coor pari(s) into components
		my $fullsite1 = ("cell" . $site1);
		$fullsite1->[0] = $value1;
		chomp($fullsite1->[0]);		#remove extra line
	}
}
sub changecell(){
	my($site, $value) = @_ ;	#takes parameters and applies to following
	my $fullsite = ("cell" . $site);
	$fullsite->[0] = $value;
	chomp($fullsite->[0]);		#remove extr line
}

#apply the visual elements
sub pruneoptions(){
	foreach my $num (0..80) {
		my $original = ("cell" . $num);
		my $modify = ($original->[0]);	
		if ($modify > 0){	#removes the cells row's/col's/box's possible in the [0] value
			my $rownum = ($original->[10]);	
			my $fullrow = ("row" . $rownum);
			foreach my $cellnum (@{$fullrow}){
				my $fullcell = ("cell" . $cellnum);
				$fullcell->[$modify] = 1;
			}
			my $colnum = ($original->[11]);
			my $fullcol = ("col" . $colnum);
			foreach my $cllnum (@{$fullcol}){
				my $fllcell = ("cell" . $cllnum);
				$fllcell->[$modify] = 1;
			}
			my $boxnum = ($original->[12]);
			my $fullbox = ("box" . $boxnum);
			foreach my $celnum (@{$fullbox}){
				my $fulcell = ("cell" . $celnum);
				$fulcell->[$modify] = 1;
			}
			foreach my $self (1..9) {
				$original->[$self] = 1;
			}
		}
	}
}

#calculates easy subscript changes
sub quickset() {
	my $progress;
	foreach my $num (1..9) {	#cuts the grid into sets through the groups 1..9
		my $setbox;
		my $setrow;
		my $setcol;
		my $storeB;
		my $storeR;
		my $storeC;
		my $cellarrB;
		my $cellarrR;
		my $cellarrC;
		my $fullblock = ("box" . $num);
		my $fullrow = ("row" . $num);
		my $fullcol = ("col" . $num);
		foreach my $position (1..9) {				#run the whole set one subscript at a time
			foreach my $cellnumB (@{$fullblock}) {	#increment cells in the Box
				 $cellarrB = ("cell" . $cellnumB);
				if (! ($cellarrB->[$position])) {	#all cells that can be of some subscript
					$setbox = $cellarrB;
					$storeB++;
				}
			}
			if ($storeB == 1){						#sets if only 1 cell could be of that subscript
				$setbox->[0] = $position;
				print "setbybox $setbox $position $setbox->[0]\n";
				$progress++;			#track cells changed this round
			}
			if ($storeB = 0){
				die "Error: No possibilities\n";
			}
			foreach my $cellnumR (@{$fullrow}) {	#increment cells in the Row
				 $cellarrR = ("cell" . $cellnumR);
				if (!($cellarrR->[$position])) {	#all cells that can be of some subscript
					$setrow = $cellarrR;
					$storeR++;
				}
			}
			if ($storeR == 1){						#sets if only 1 cell could be of that subscript
				$setrow->[0] = $position;
				print "setbyrow $setrow $position $setrow->[0]\n";
				$progress++;			#track cells changed this round
			}
			if ($storeR = 0){
				die "Error: No possibilities\n";
			}
			foreach my $cellnumC (@{$fullcol}) {	#increment cells in the Column
				$cellarrC = ("cell" . $cellnumC);
				if (!($cellarrC->[$position])) {	#all cells that can be of some subscript
					$setcol = $cellarrC;	
					$storeC++;
				}
			}
			if ($storeC == 1){						#sets if only 1 cell could be of that subscript
				$setcol->[0] = $position;
				print "setbycol $setcol $position $setcol->[0]\n";
				$progress++;			#track cells changed this round
			}
			if ($storeC = 0){
				die "Error: No possibilities\n";
			}
			&pruneoptions;
		}
		print "---progress round $num: $progress\n";
	}
	if ($progress){
			&quickset;
	}else{&setviscell;}
}
sub setviscell() {
	my $runv;			#added
	my $againv = $runv;	#added
	foreach my $num (0..80) {
		my $visval;
		my $store;
		my $figure = ("cell" . $num);
		if (! $figure->[0]) {
			my $cycle = 1;
			while ($cycle < 10) {
				if ($figure->[$cycle]) {	
					$cycle++;
				}
				if (!($figure->[$cycle])) {
					$store++;
					$visval = $cycle;
					$cycle++;
				}
			}
			if ($store == 1){
				$runv++;
				$figure->[0] = $visval;
				print "setviscell $figure $figure->[0]\n";
			}
		}
	}
	if (!($runv==$againv)){
		&pruneoptions;
		print "-BACK TO Quicks\n";
		&quickset;
	}
	if ($runv==$againv){
		&pruneoptions;
		print "YAY\n";
	}
}
#infers hard(er) subscript changes
sub bobsled{
	foreach my $change (1..9){
		foreach my $box (1..9){
			my @val;
			my $lala = 0;
			my $look = ("box" . $box);
			print "in $look with $change\n";
			foreach my $cellnum (@{$look}){
				my $here = "cell" . $cellnum;
				#if ($val == 2){print "here now $here->[2]\n";}
				if (! ($here->[$change])){
					$val[$lala] = $cellnum;
					$lala++;
				}
			}
			# "$#val" returns highest index of @val
			if ($#val == 1){
				#print "now\n";
				my $cell = $val[0];
				my $name = $val[1];
				my $real = "cell" . $cell;
				my $ral = "cell" . $name;
				print "$real $real->[11] $ral $ral->[11]\n";
				if ($real->[10] == $ral->[10]){	#for two in a row
					print "and rowck\n";
					my $rownum = ($real->[10]);	
					my $fullrow = ("row" . $rownum);
					foreach my $cellnum (@{$fullrow}){
						my $fullcell = ("cell" . $cellnum);
						$fullcell->[$change] = 1;
					}
					#print "pruned row\n";
				}
				if ($real->[11] == $ral->[11]){	#for two in a col
					print "and colck\n";
					my $colnum = ($real->[11]);	
					my $fullcol = ("col" . $colnum);
					foreach my $cellnum (@{$fullcol}){	#set co column-ar subscripts to 1
						my $fullcell = ("cell" . $cellnum);
						$fullcell->[$change] = 1;
					}
				}
				$real->[$change] = 0;
				$ral->[$change] = 0;
				print "set by bobsled $real $ral $change\n";
			}
			&pruneoptions;
		}
	}
}

sub working {
	my $done = 0;
	while ($done<406){
		if ($done == 405){
			&prettyprint;
			die;
		}
		&quickset();
		$done = 0;
		foreach my $run (0..80){
			my $name = ("cell" . $run);
			$done += ($name->[0]);
		}
	}
}




&change81;
&printtable(0);
&pruneoptions;
&quickset;

=for comment
&bobsled;
&quickset;
=cut

##
##
#	IDEA: Compare the 81 digit string before and after &setbyrow
##
##




################################
## Quickset combines these 3  ##
################################

sub setbyrow(){
	my $runr;			#added
	my $againr = $runr;	#added
	foreach my $block (1..9) {	#block means "row"
		my $setrow;
		my $store;
		my $cellarr;
		my $fullrow = ("row" . $block);
		foreach my $position (1..9) {
			foreach my $cellnum (@{$fullrow}) {
				 $cellarr = ("cell" . $cellnum);
				if (!($cellarr->[$position])) {
					$setrow = $cellarr;
					$store++;
				}
			}
			if ($store == 1){
				$runr++;	#added
				$setrow->[0] = $position;
				print "setbyrow $setrow $position $setrow->[0]\n";
			}
			if ($store = 0){
				die "Error: No possibilities\n";
			}
		}
	}
	if (!($runr==$againr)){ #added 261-269
		&pruneoptions;
		print "ROW SET AGAIN\n";
		&setbyrow;
	}
	if ($runr==$againr){
		&pruneoptions;
		print "TO COLUMN SET\n";
		&setbycol;
	}
}					
sub setbycol(){
	my $runc;		#added
	my $againc;		#added
	foreach my $block (1..9) {	#block means "box"
		my $setcol;
		my $store;
		my $cellarr;
		my $fullcol = ("col" . $block);
		foreach my $position (1..9) {
			foreach my $cellnum (@{$fullcol}) {
				$cellarr = ("cell" . $cellnum);
				if (!($cellarr->[$position])) {
					$setcol = $cellarr;
					$store++;
				}
			}
			if ($store == 1){
				$setcol->[0] = $position;
				$runc++;		#added
				print "setbycol $setcol $position $setcol->[0]\n";
			}
			if ($store = 0){
				die "Error: No possibilities\n";
			}
		}
	}
	if (!($runc==$againc)){		#added 298-307
		&pruneoptions;
		print "BACK TO ROW SET\n";
		&setbyrow;
	}
	if ($runc==$againc){		#changed from $runc==$againc  POSISIBLE Error
		&pruneoptions;
		print "TO BOX\n";
		&setbybox;
	}
}
sub setbybox(){
	my $runb;		#added
	my $againb;		#added
	foreach my $block (1..9) {	#block means "box"
		my $setbox;
		my $store;
		my $cellarr;
		my $fullblock = ("box" . $block);
		foreach my $position (1..9) {
			foreach my $cellnum (@{$fullblock}) {
				 $cellarr = ("cell" . $cellnum);
				if (! ($cellarr->[$position])) {
					$setbox = $cellarr;
					$store++;
				}
			}
			if ($store == 1){
				$setbox->[0] = $position;
				$runb++;		#added
				print "setbybox $setbox $position $setbox->[0]\n";
			}
			if ($store = 0){
				die "Error: No possibilities\n";
			}
		}
	}
	if (!($runb==$againb)){		#added 311-315
		&pruneoptions;
		print "TO ROW AGAIN\n";
		&setbyrow;
	}
	if ($runb==$againb){
		&pruneoptions;
		print "TO CELL\n";
		&setviscell();
	}
}

&prettyprint(0);

foreach my $num (1..9){
	&prettyprint($num);
}


#my $done;
#until ($done == 10){
#	foreach my $num (0..80){
#		my $close = ("cell" . $num);
#		$done += $close->[0];
#	}
#	&pruneoptions;
#	&setviscell;
#
#	&pruneoptions;
#	&setbybox;
#
#	&pruneoptions;
#	&setbyrow;
#
#	&pruneoptions;
#	&setbycol;
#	if ($done ==10) {
#		&printtable(0);
#		die "Complete\n";
#	}
#}
