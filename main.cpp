#include <cstdio>
#include <cstdlib>

#include <png.h>

int main()
{
	printf("using libpng %s\n", png_get_header_ver(nullptr));
	return EXIT_SUCCESS;
}
