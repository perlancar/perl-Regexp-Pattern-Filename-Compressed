package Regexp::Pattern::Filename::Compressed;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
#use utf8;

use Filename::Compressed ();

our %RE;

my $re = join '|', map {quotemeta} sort keys %Filename::Compressed::SUFFIXES;
$re = qr((?:$re)\z)i;

$RE{filename_compressed} = {
    summary => 'Compressed data filename',
    pat => $re,
    tags => ['anchored'],
    examples => [
        {str=>'foo', matches=>0, summary=>'No extension'},
        {str=>'gz', matches=>0, summary=>'Not an extension'},
        {str=>'foo.gz', matches=>1},
        {str=>'foo bar.TAR.BZ2', matches=>1, summary=>'Case insensitive'},
        {str=>'foo.xz is the file', matches=>0, summary=>'Regex is anchored'},
        {str=>'foo.mp3', matches=>0},
    ],
};

1;
# ABSTRACT: Compressed data filename

=head1 DESCRIPTION

This is a L<Regexp::Pattern> wrapper for L<Filename::Compressed>.


=head1 SEE ALSO

L<Regexp::Pattern>

L<Filename::Compressed>
