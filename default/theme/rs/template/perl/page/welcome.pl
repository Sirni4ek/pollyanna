#!/usr/bin/perl -T

use strict;
use warnings;


sub GetWelcomePage {
	require_once('page/profile.pl'); # GetProfileDialog()
	my $welcomePage =
		GetPageHeader('welcome') .
			GetWindowTemplate(GetTemplate('html/page/welcome.template'), 'Welcome') .
			'<form action="/post.html" method=GET id=compose class=submit name=compose target=_top>' .
			GetWriteForm() .
			'</form>' . #todo unhack this
			GetProfileDialog() .
			GetQueryAsDialog('threads', 'Threads') .
			GetPageFooter('welcome');

	if (GetConfig('admin/js/enable')) {
		my @js = qw(avatar puzzle settings profile utils timestamp clock fresh table_sort voting write);
		if (GetConfig('admin/php/enable')) {
			push @js, 'write_php'; # write.html
		}
		$welcomePage = InjectJs($welcomePage, @js)

	}

	return $welcomePage;
}

1;
