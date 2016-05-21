#!/usr/bin/env perl6

use v6;
use lib 'lib';
use GTK::Simple;

my $app = GTK::Simple::App.new(title => "Combo Box");
$app.size-request(300,100);

my $combo = GTK::Simple::ComboBoxText.new();

for <one two three four five six> -> $item {
    $combo.append-text("Entry " ~ $item);

}

$combo.set-active(5);

my $label = GTK::Simple::Label.new(text => "not selected");

$combo.changed.tap({
    $label.text = $combo.active-text();
});

=comment preset the active item.

my $pre-set-combo = GTK::Simple::ComboBoxText.new();
my @items = <zero one two three four five six>;

for @items -> $item {
    $pre-set-combo.append-text( $item )
}

$pre-set-combo.set-active( 3 );
=comment
    If the index is 0 > index > @item.end then nothing happens.

my $lbl2 = GTK::Simple::Label.new( text => @items[3] );

$pre-set-combo.changed.tap: { $lbl2.text = $pre-set-combo.active-text();  };


$app.set-content(GTK::Simple::VBox.new($label, $combo, $lbl2, $pre-set-combo));

$app.run;
