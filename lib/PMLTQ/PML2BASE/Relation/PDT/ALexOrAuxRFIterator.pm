package PMLTQ::PML2BASE::Relation::PDT::ALexOrAuxRFIterator;

# ABSTRACT: a/lex.rf or a/aux.rf relation iterator for PDT like treebanks

use strict;
use warnings;


sub init_sql {
  my ($table_name, $schema, $desc, $fh) = @_;

  $fh->{'#POST_SQL'}->print(<<"EOF");
INSERT INTO "${table_name}"
  SELECT t."#idx" AS "#idx", a."lex" AS "#value"
    FROM "t-node" t JOIN "t-a" a ON a."#idx"=t."a"
  UNION
  SELECT t."#idx" AS "#idx", aux."#value" AS "#value"
    FROM "t-node" t JOIN "t-a" a ON a."#idx"=t."a" JOIN "t-a/aux.rf" aux ON aux."#idx"=a."aux.rf"
  UNION
  SELECT r."#idx" AS "#idx", r."atree" FROM "t-root" r;
EOF
}

1;
