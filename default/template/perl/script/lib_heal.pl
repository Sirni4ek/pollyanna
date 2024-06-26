#!/usr/bin/perl

# This script is used to test for missing libraries and try to fill them in from default
# I've found this useful primarily on DreamHost, where I don't have root access and can't install libraries


my $os = '';

# Determine which type of os we are using:
if ($^O eq 'MSWin32' or $^O eq 'cygwin') {
	$os = 'windows';
} elsif ($^O eq 'linux' or $^O eq 'darwin') {
	$os = 'gnu';
} elsif ($^O eq 'darwin') {
	$os = 'mac';
} elsif ($^O eq 'solaris') {
	$os = 'solaris';
} elsif ($^O eq 'freebsd') {
	$os = 'freebsd';
} else {
	$os = 'unknown';
}


# test for missing libraries and try to fill them in from default
my $result = system("perl -e 'use lib qw(lib); use URI::Encode;' >/dev/null 2>&1");

if ($result) {
	# problem including URI::Encode

	# there are three possible solutions to this problem:

	# 1) we can try to use regular CPAN to install the library
	# challenge: for this, it is easier if we use sudo

	# 2) we can try to fill the library in from default (copy we brought along with us in the repo)
	# challenge: it may be the wrong version

	# 3) we may just need to remove the library from lib/ if a version conflict is causing the problem
	# challenge: how to detect this?

	if ($os eq 'gnu' || $os eq 'mac' || $os eq 'freebsd' || $os eq 'solaris') { # 2)
		# if the library is missing, we can try to fill it in from the one we brought with us in the repo:
		system("mkdir lib; mkdir lib/URI; cp default/template/perl/lib/URI/Encode.pm lib/URI/Encode.pm");
	} elsif ($os eq 'windows') {
		system("mkdir lib; mkdir lib/URI; copy default\\template\\perl\\lib\\URI\\Encode.pm lib\\URI\\Encode.pm");
	} else {
		#todo
	}
} else {
	# 0 means it is ok
}

# test for missing libraries and try to fill them in from default
my $result = system("perl -e 'use lib qw(lib); use URI::Escape;' >/dev/null 2>&1");

if ($result) {
	# problem including URI::Escape

	# there are three possible solutions to this problem:

	# 1) we can try to use regular CPAN to install the library
	# challenge: for this, it is easier if we use sudo

	# 2) we can try to fill the library in from default (copy we brought along with us in the repo)
	# challenge: it may be the wrong version

	# 3) we may just need to remove the library from lib/ if a version conflict is causing the problem
	# challenge: how to detect this?

	if ($os eq 'gnu' || $os eq 'mac' || $os eq 'freebsd' || $os eq 'solaris') { # 2)
		# if the library is missing, we can try to fill it in from the one we brought with us in the repo:
		system("mkdir lib; mkdir lib/URI; cp default/template/perl/lib/URI/Escape.pm lib/URI/Escape.pm");
	} elsif ($os eq 'windows') {
		system("mkdir lib; mkdir lib/URI; copy default\\template\\perl\\lib\\URI\\Escape.pm lib\\URI\\Escape.pm");
	} else {
		#todo
	}
} else {
	# 0 means it is ok
}
