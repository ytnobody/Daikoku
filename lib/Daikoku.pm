package Daikoku;
use strict;
use warnings;
use Nephia plugins => ['PocketIO'];

our $VERSION = 0.01;

path '/' => sub {
    my $req = shift;
    return {
        template => 'index.html',
        title    => config->{appname},
        envname  => config->{envname},
        apppath  => 'lib/' . __PACKAGE__ .'.pm',
    };
};

use Data::Dumper;

pocketio 'mes' => sub {
    my ($socket, $mes) = @_;
    $socket->emit('server_mes', $mes);
};

1;

=head1 NAME

Daikoku - Web Application

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

Daikoku is web application based Nephia.

=head1 AUTHOR

clever guy

=head1 SEE ALSO

Nephia

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

