#!/usr/bin/perl
#
# creates a simple (Graphviz) .dot file from a GEDCOM file
# input : STDIN  ; output : STDOUT
# usage is './ged2dot.pl < x.ged > x.dot'
# or './ged2dot.pl < x.ged |dot -Tps -o x.ps'
#  (when converting to .pdf, use 'identify x.ps
#	and ps2pdf -dDEVICEWIDTHPOINTS=2800 -dDEVICEHEIGHTPOINTS=1024 x.ps x.pdf'
#
sub wash{ # removes '@' from node names
	my $x = $_[0];
	$x =~ s/\@//g;
	return($x);
	}
print "digraph G {\n";
while ($line = <STDIN>)
	{
	if ($line =~ /^0 (.*) INDI/)
		{
		$node_indi = wash($1);
		}
	if ($line =~ /^1 NAME (.*?) .*\/(.*)\//)
		{ # 1 NAME James Dewey /Watson/ --> James Watson
		print "  $node_indi [label=\"$1 $2\"]\n";
		}
	if ($line =~ /^1 FAMC (.*)$/)
		{
		printf("    %s -> %s\n", wash($1), $node_indi);
		}
	if ($line =~ /^1 FAMS (.*)$/)
		{
		printf("    %s -> %s\n", $node_indi, wash($1));
		}
	}
print "}\n";
