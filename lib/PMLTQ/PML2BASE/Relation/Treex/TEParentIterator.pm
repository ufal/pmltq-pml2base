package PMLTQ::PML2BASE::Relation::Treex::TEParentIterator;

# ABSTRACT: Effective parent relation iterator on t-nodes for Treex treebanks

use strict;
use warnings;
use PMLTQ::PML2BASE;

sub dump_relation {
  my ($tree, $hash, $fh ) = @_;
  my $name = $tree->type->get_schema->get_root_name;
  die 'Trying dump relation eparent for incompatible schema' unless $name =~ /^treex_document/;

  my $struct_name = $tree->type->get_structure_name || '';
  return unless $struct_name eq 't-root';

  for my $node ( $tree->descendants ) {
    for my $p ( PMLTQ::Relation::Treex::TGetEParents($node) ) {
      $fh->print( PMLTQ::PML2BASE::mkdump( $hash->{$node}{'#idx'}, $hash->{$p}{'#idx'} ) );
    }
  }
}

1;
