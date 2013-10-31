#!/usr/bin/perl

## This will build a landscape, starting with 1 triangle.

#setup

$a = new Landscape;

$a->print;

package Landscape;
  sub new {
    my $class = shift;
    my $first = new Unit([[0,0,0],[1,0,0],[0,1,0]]);
    my $perimeter = {
      "offset" => 1, #starts at 1:00 position
      "angles" => [4,4,4], #simple triangle
      "shapes" => [\$first, \$first, \$first]
    };
    bless $perimeter, $class;
  }

  sub print {
    my $self = shift;
    print $self->{"offset"}, "\n";
    print join(",",@{$self->{"angles"}}), "\n";
  }


package Unit;
  # A Unit is one shape in the mesh, either a triangle or parallegram
  sub new {
    my $class = shift;
    my $points  = shift;
    bless { "points" => $points }, $class
  }

  sub triangle {
    return 1 if (scalar($self->{points}) == 3);
    0;
  }
