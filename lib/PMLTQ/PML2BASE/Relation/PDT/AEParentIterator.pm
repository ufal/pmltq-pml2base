package PMLTQ::PML2BASE::Relation::PDT::AEParentIterator;

# ABSTRACT: Effective parent relation iterator on a-nodes for PDT like treebanks

use strict;
use warnings;
use PMLTQ::PML2BASE;
use PMLTQ::Relation::PDT;

sub dump_relation {
  my ($tree,$hash,$fh)=@_;

  my $name = $tree->type->get_schema->get_root_name;
  die 'Trying dump relation eparent for incompatible schema' unless $name =~ /^adata/;

  for my $node ($tree->descendants) {
    for my $p (PMLTQ::Relation::PDT::AGetEParents($node,\&PMLTQ::Relation::PDT::ADiveAuxCP)) {
      $fh->print(PMLTQ::PML2BASE::mkdump($hash->{$node}{'#idx'},$hash->{$p}{'#idx'}));
    }
  }
}


1;
