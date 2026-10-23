use v5.36;
use Test::More;
use CPAN::Meta;
use Pod::Simple::Checker;
use Tk::TickitBridge;
my $meta = CPAN::Meta->load_file('META.json');
is_deeply([$meta->license], ['perl_5'], 'same terms as Perl itself');
is($meta->version, $Tk::TickitBridge::VERSION, 'distribution version');
for my $file ('lib/Tk/TickitBridge.pm', 'lib/Tk/TickitBridge/Loop.pm') {
    my $errors = '';
    my $parser = Pod::Simple::Checker->new;
    $parser->output_string(\$errors);
    $parser->parse_file($file);
    is($errors, '', "POD valid: $file");
}
done_testing;
