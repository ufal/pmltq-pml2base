package PMLTQ::PML2BASE::Relation::Treex::AEParentCIterator;

# ABSTRACT: Different implementation of effective parent relation iterator on a-nodes for Treex treebanks

=head1 DESCRIPTION

Classic effective parent implementation is skipping nodes with afuns that match /Aux[CP]/. This one doesn't.

=cut

use strict;
use warnings;
use PMLTQ::PML2BASE;


sub dump_relation {
  my ($tree, $hash, $fh ) = @_;
  my $name = $tree->type->get_schema->get_root_name;
  die 'Trying dump relation eparent for incompatible schema' unless $name =~ /^treex_document/;

  my $struct_name = $tree->type->get_structure_name || '';
  return unless $struct_name eq 'a-root';

  for my $node ( $tree->descendants ) {
    for my $p ( PMLTQ::Relation::Treex::AGetEParentsC($node) ) {
      $fh->print( PMLTQ::PML2BASE::mkdump( $hash->{$node}{'#idx'}, $hash->{$p}{'#idx'} ) );
    }
  }
}

1;
