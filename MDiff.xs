#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <mdiff_functions.h>

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
{
    errno = 0;
    switch (*name) {
    case 'a':
	break;
    case 'b':
	break;
    case 'c':
	break;
    case 'd':
	break;
    case 'e':
	break;
    case 'f':
	break;
    case 'g':
	break;
    case 'h':
	break;
    case 'i':
	break;
    case 'j':
	break;
    case 'k':
	break;
    case 'l':
	break;
    case 'm':
	if (strEQ(name, "mdiff_functions_H"))
#ifdef mdiff_functions_H
	    return mdiff_functions_H;
#else
	    goto not_there;
#endif
	break;
    case 'n':
	break;
    case 'o':
	break;
    case 'p':
	break;
    case 'q':
	break;
    case 'r':
	break;
    case 's':
	break;
    case 't':
	break;
    case 'u':
	break;
    case 'v':
	break;
    case 'w':
	break;
    case 'x':
	break;
    case 'y':
	break;
    case 'z':
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}


MODULE = MDiff		PACKAGE = MDiff		


double
constant(name,arg)
	char *		name
	int		arg


int 
is_mdiff(m,str1,str2)
        int    m
        char * str1
        char * str2
