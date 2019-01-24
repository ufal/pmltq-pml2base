package PMLTQ::PML2BASE::Relation::PDT::TEParentIterator;

# ABSTRACT: Effective parent relation iterator on t-nodes for PDT like treebanks

use strict;
use warnings;
use PMLTQ::PML2BASE;
use PMLTQ::Relation::PDT;


sub dump_relation {
  my ($tree,$hash,$fh)=@_;

  my $name = $tree->type->get_schema->get_root_name;
  die 'Trying dump relation eparent for incompatible schema' unless $name =~ /^tdata/;

  for my $node ($tree->descendants) {
    for my $p (PMLTQ::Relation::PDT::TGetEParents($node)) {
      $fh->print(PMLTQ::PML2BASE::mkdump($hash->{$node}{'#idx'},$hash->{$p}{'#idx'}));
    }
  }
}

1;
